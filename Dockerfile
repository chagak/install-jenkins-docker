FROM jenkins/jenkins:lts-jdk17
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins

# # FROM jenkins/jenkins:lts-jdk17
# # USER root
# # RUN apt-get update && apt-get install -y \
# #     apt-transport-https \
# #     ca-certificates \
# #     curl \
# #     software-properties-common \
# #     lsb-release && \
# #     curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
# #     https://download.docker.com/linux/debian/gpg && \
# #     echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
# #     https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list && \
# #     apt-get update && \
# #     apt-get install -y docker-ce-cli && \
# #     groupadd -f docker && \
# #     usermod -aG docker jenkins && \
# #     rm -rf /var/lib/apt/lists/*

# FROM jenkins/jenkins:lts-jdk17

# USER root

# # Install required dependencies
# RUN apt-get update && apt-get install -y \
#     apt-transport-https \
#     ca-certificates \
#     curl \
#     software-properties-common \
#     lsb-release \
#     maven  # Ensure Maven is installed

# # Add Docker official GPG key
# RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
#     https://download.docker.com/linux/debian/gpg

# # Add Docker repository
# RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
#     https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# # Install Docker CLI
# RUN apt-get update && apt-get install -y docker-ce-cli

# # Create Docker group and add Jenkins user
# RUN groupadd --system docker && usermod -aG docker jenkins

# # **Set JAVA_HOME environment variable**
# ENV JAVA_HOME=/opt/java/openjdk
# ENV PATH="$JAVA_HOME/bin:$PATH"

# # Cleanup
# RUN rm -rf /var/lib/apt/lists/*

# USER jenkins
