
def cleanup(agent, facts)
    # stop puppet, or it might reassign the token
    agent.run("service puppet stop")
    agent.reply[:status] = agent.run("/opt/couchbase/bin/couchbase-cli rebalance -c localhost:8091 -u couchbase -p password --server-remove=localhost:8091", :stdout => :out, :stderr => :err)
end
