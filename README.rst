mcollective-cleanup
===================

Perform service specific cleanup tasks before destroying a server.
If you need a specific cleanup command to be performed before a server with a
specific role is destroyed, please fork this repo and add a file in the ``cleaners``
directory with the name of the role.

For a server with the role *cassandra* a file named cassandra.rb needs to be created.

Inside that file you need to define one function named ``clean`` which will receive
a ``Hash`` containing all the server facts::

    def clean(facts)
        # stop puppet, or it might reassign the token
        %x{service puppet stop}
    
        #revoke the server token, so the rest of the servers will be balanced.
        token = %x{nodetool info}.split[2]
        return %x{nodetool removetoken #{token}}
    end

After that send us a pull request and we will add the cleanup command.