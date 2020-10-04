FROM python:3.8-slim
ARG username=labuser
WORKDIR /work
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "/code"]
COPY requirements.txt .
RUN apt-get -qq update; \
    apt-get install -qqy \
        graphviz ruby-graphviz \
        python-pydot python3-pydot python-pygraphviz python3-pygraphviz; \
    rm -rf /var/lib/apt/lists/*
RUN pip install -r requirements.txt
RUN useradd -ms /bin/bash $username
USER $username
