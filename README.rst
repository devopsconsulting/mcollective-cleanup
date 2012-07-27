mcollective-cleanup
===================

Perform service specific cleanup tasks before destroying a server.
If you need a specific cleanup command to be performed before a server with a
specific role is destroyed, please fork this repo and add a file in the ``cleaners``
directory with the name of the role.

For a server with the role *cassandra* a file named cassandra.rb needs to be created.

Inside that file you need to define one function named ``cleanup`` which will receive
the ``agent`` instance and a ``Hash`` containing all the server facts::

    def cleanup(agent, facts)
        # stop puppet, or it might reassign the token
        agent.run("service puppet stop")
    
        # determine this server's token
        nodetool_info = ""
        status = agent.run("nodetool info", :stdout => nodetool_info, stderr => :err)
    
        if status == 0
            token = nodetool_info.split[2]
    
            #revoke the server token, so the rest of the servers will be balanced.
            agent.reply[:status] = agent.run("nodetool removetoken #{token}", :stdout => :out, :stderr => :err)
        else
            agent.reply[:status] = status
            agent.reply[:out] = nodetool_info
            # :err was allready set when running nodetool info
        end
    end

Make sure to set the ``:status``, ``:out`` and ``:err`` keys on the ``reply`` field.

After that send us a pull request and we will add the cleanup command.