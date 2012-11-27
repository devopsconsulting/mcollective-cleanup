
def cleanup(agent, facts)
    # stop puppet, or it might reassign the token
    agent.command("service puppet stop")

    # determine this server's token
    nodetool_info = ""
    status = agent.command("nodetool info", :stdout => nodetool_info, stderr => :err)
    
    if status == 0
        token = nodetool_info.split[2]
        
        #revoke the server token, so the rest of the servers will be balanced.
        agent.reply[:status] = agent.command("nodetool removetoken #{token}", :stdout => :out, :stderr => :err)
    else
        agent.reply[:status] = status
        agent.reply[:out] = nodetool_info
        # :err was allready set when running nodetool info
    end
end
