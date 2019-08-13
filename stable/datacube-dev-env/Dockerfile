FROM opendatacube/datacube-core:1.7

ENV DEBIAN_FRONTEND=noninteractive

RUN groupadd -r owsgroup && \
    useradd -r -g owsgroup owsuser

RUN apt-get update && apt-get install -y \
    python3-matplotlib \
    python3-pil\
    libpng-dev \
    wget \
    vim \
    unzip \
    postgresql-client \
    jq \
    yq \
    awscli \
    curl \
    libev-dev \
    split \
    && rm -rf /var/lib/apt/lists/*

# Perform setup install
RUN mkdir -p /code/setup
WORKDIR /code/setup

ADD . .

# On Ubuntu 18.04 default pip version is awfully old and does not support --extra-index-url command line option,
# so make sure to upgrade pip first: pip3 install --upgrade pip.
RUN pip3 install --upgrade pip \
    && rm -rf $HOME/.cache/pip

COPY requirements.txt .

RUN pip3 install -r requirements.txt \
    && rm -rf $HOME/.cache/pip

# ODC cloud tools depend on aiobotocore which has a dependency on a specific version of botocore,
# boto3 also depends on a specific version of botocore as a result having both aiobotocore and boto3 in one
# environment can be a bit tricky. The easiest way to solve this is to install aiobotocore[awscli,boto3] before
# anything else, which will pull in a compatible version of boto3 and awscli into the environment.
RUN pip3 install -U 'aiobotocore[awscli,boto3]' \
    && rm -rf $HOME/.cache/pip

RUN pip3 install --extra-index-url="https://packages.dea.gadevs.ga" \
    odc-apps-cloud \
    odc-apps-dc-tools \
    && rm -rf $HOME/.cache/pip

RUN pip3 install . \
  && rm -rf $HOME/.cache/pip

#COPY docker/wms-entrypoint.sh /usr/local/bin/wms-entrypoint.sh
#COPY docker/get_wms_config.sh /usr/local/bin/get_wms_config.sh
#COPY docker/update-and-reload.sh /usr/local/bin/update-and-reload.sh

COPY docker/auxiliary/setup-k/assets/create-db.sh .
COPY docker/auxiliary/setup-k/assets/drop-db.sh .

# Install dea proto for indexing tools
RUN mkdir -p /code/index/indexing
WORKDIR /code/index/indexing

COPY docker/auxiliary/index-k/assets/update_ranges.sh .
COPY docker/auxiliary/index-k/assets/update_ranges_wrapper.sh .
ADD https://raw.githubusercontent.com/opendatacube/datacube-dataset-config/master/scripts/index_from_s3_bucket.py \
    ls_s2_cog.py

WORKDIR /code/index
COPY docker/auxiliary/index-k/assets/create-index.sh .

# Archive install
RUN mkdir -p /code/archive/archiving
WORKDIR /code/archive

COPY docker/auxiliary/archive/assets/archive-wrapper.sh .

WORKDIR /code/archive/archiving
COPY docker/auxiliary/archive/assets/archive.sh .
ADD https://raw.githubusercontent.com/opendatacube/datacube-dataset-config/master/scripts/index_from_s3_bucket.py \
    ls_s2_cog.py

WORKDIR /code

# Create owsuser directory using root access
RUN mkdir -p /home/owsuser

# Create a new .datacube.conf file in owsuser home directory as a root user
RUN echo "[datacube]" > /home/owsuser/.datacube.conf

# Change the ownership from root to owsuser
RUN chown -R owsuser /code/*
RUN chown -R owsuser /usr/local/*
RUN chown owsuser /home/owsuser/.datacube.conf

# Run container as an owsuser instead as root user
USER owsuser

#ENTRYPOINT ["wms-entrypoint.sh"]
#
#CMD gunicorn -b '0.0.0.0:8000' -w 4 --timeout 120 datacube_wms.wsgi --pid=gunicorn.pid
