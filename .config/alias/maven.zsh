alias mc='mvn clean'

alias mi='mvn install'
alias mio='mvn install -o'
alias mif='mvn install -T 1C'
alias miof='mvn install -o -T 1C'
alias miont='mvn install -o -Dmaven.test.skip=true'
alias mint='mvn install -Dmaven.test.skip=true'
alias mir='mvn install -rf'
alias mip='mvn install -pl'

alias mci='mvn clean && mvn install'
alias mcio='mvn clean && mvn install -o'
alias mcif='mvn clean && mvn install -T 1C'
alias mciof='mvn clean && mvn install -o -T 1C'
alias mciont='mvn clean && mvn install -o -Dmaven.test.skip=true'
alias mcint='mvn clean && mvn install -Dmaven.test.skip=true'
alias mcir='mvn clean && mvn install -rf'
alias mcip='mvn clean && mvn install -pl'

alias miq='mvn clean && mvn install -o -T 1C -Dmaven.test.skip=true'

