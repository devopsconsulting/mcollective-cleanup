
def cleanup(agent, facts)
    # stop puppet, or it might reassign the token
    agent.command("service puppet stop")
    agent.reply[:status] = agent.command("/opt/couchbase/bin/couchbase-cli rebalance -c localhost:8091 -u couchbase -p password --server-remove=localhost:8091", :stdout => :out, :stderr => :err)
end
