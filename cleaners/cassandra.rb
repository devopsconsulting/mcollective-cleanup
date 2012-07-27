
def clean(facts)
    # stop puppet, or it might reassign the token
    %x{service puppet stop}

    #revoke the server token, so the rest of the servers will be balanced.
    token = %x{nodetool info}.split[2]
    return %x{nodetool removetoken #{token}}
end
