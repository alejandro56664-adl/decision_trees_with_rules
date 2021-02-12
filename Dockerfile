FROM neo4j:3.3.1

ENV NEO4J_HOME="/var/lib/neo4j"
ADD https://repo1.maven.org/maven2/org/codehaus/janino/commons-compiler/3.0.8/commons-compiler-3.0.8.jar "${NEO4J_HOME}"/plugins/
ADD https://repo1.maven.org/maven2/org/codehaus/janino/janino/3.0.8/janino-3.0.8.jar "${NEO4J_HOME}"/plugins/

COPY target/decision_trees_with_rules-1.0-SNAPSHOT.jar "${NEO4J_HOME}"/plugins/.
RUN echo "dbms.security.procedures.unrestricted=com.maxdemarzi.*" >> "${NEO4J_HOME}"/conf/neo4j.conf

EXPOSE 7474 7473 7687

#for 4.2.3
#ENTRYPOINT ["/sbin/tini", "-g", "--", "/docker-entrypoint.sh"]
#for 3.3.1
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["neo4j"]