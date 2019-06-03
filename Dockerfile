FROM centos:7

RUN yum -y install https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm sqlite-devel mysql-devel openssl-devel unzip gcc gcc-c++ make 

RUN mkdir -p /root/.localpython
#ADD ["http://www.python.org/ftp/python/2.7.9/Python-2.7.9.tgz","/usr/src"]
COPY ["Python-2.7.14.tgz","/usr/src"]
RUN cd /usr/src && tar -zxf Python-2.7.14.tgz \
    && cd Python-2.7.14 && ./configure --prefix=/root/.localpython \
    && make && make install && rm -f /usr/src/Python-2.7.14.tgz
        
#ADD ["https://files.pythonhosted.org/packages/34/bc/fa0b5347139cd9564f0d44ebd2b147ac97c36b2403943dbee8a25fd74012/virtualenv-16.0.0.tar.gz","/usr/src"]
COPY ["virtualenv-16.0.0.tar.gz","/usr/src"]
RUN cd /usr/src && tar -zxf virtualenv-16.0.0.tar.gz && cd virtualenv-16.0.0/ \
    && /root/.localpython/bin/python2.7 setup.py install

RUN mkdir -p /root/venv && cd /root/venv \
    && /root/.localpython/bin/virtualenv py2.7 --python=/root/.localpython/bin/python2.7

RUN cd /root/venv/py2.7/bin && source ./activate && pip install pyvirtualdisplay selenium robotframework robotframework-selenium2library

COPY ["chromedriver_linux64.zip","/usr/src"]
RUN cd /usr/src && unzip -o chromedriver_linux64.zip && mv chromedriver /usr/local/bin/ \
    && rm -rf chromedriver_linux64.zip Python-2.7.9* virtualenv-16.0.0* 

COPY ["imediaV2.3/","/root/test/imediaV2.3"]    
COPY ["start.sh","/root/test"]

CMD ["/root/test/start.sh"]
