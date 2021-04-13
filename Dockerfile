FROM vault:latest

ADD start.sh /usr/bin/start.sh
RUN chmod 755 /usr/bin/start.sh

CMD /bin/bash /usr/bin/start.sh
