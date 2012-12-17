
def cleanup(agent, facts)
    # stop puppet, or it might reassign the token
    agent.command("service puppet stop")

    # decommission the node.
    agent.reply[:status] = agent.command("nodetool decommission", :stdout => :out, :stderr => :err)
end
