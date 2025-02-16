# Dockerfile
FROM container-registry.oracle.com/database/free:latest

# Environment variables
ENV ORACLE_PWD=E
ENV PATH=$ORACLE_HOME/bin:$PATH

# Copy installation scripts
COPY scripts/unattended_apex_install_23c.sh /home/oracle/
COPY scripts/00_start_apex_ords_installer.sh /opt/oracle/scripts/startup/

# Set execute permissions
RUN chmod +x /home/oracle/unattended_apex_install_23c.sh && \
    chmod +x /opt/oracle/scripts/startup/00_start_apex_ords_installer.sh

# Expose required ports
EXPOSE 1521 5500 8080 8443 22

# Default command
CMD ["/bin/bash", "-c", "exec $ORACLE_BASE/$RUN_FILE"]
