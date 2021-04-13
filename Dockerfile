FROM vault:latest

RUN apk --update add redis postgresql-client curl bash vim
ADD init.sql /init.sql
ADD start.sh /usr/bin/start.sh
ADD unseal.sh /usr/bin/unseal.sh
RUN chmod 755 /usr/bin/start.sh /usr/bin/unseal.sh

CMD /bin/sh /usr/bin/start.sh
