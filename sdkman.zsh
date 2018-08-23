export SDKMAN_DIR="$HOME/.sdkman"
export JAVA_HOME="$SDKMAN_DIR/java/candidates/current"
export JDK_HOME=$JAVA_HOME
export GRADLE_HOME="$SDKMAN_DIR/gradle/candidates/current"
export PATH=$PATH:$JAVA_HOME/bin:$GRADLE_HOME/bin

[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
