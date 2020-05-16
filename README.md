# fluentd-monasca
Fluentd output plugin for the Monasca API.

Note that this does not support the Monasca Log API which has been
deprecated. If you wish to use the Monasca Log API, please use release
0.1.1.

## Requirements
* `ruby`
* `td-agent`

## Installation
To install the `fluentd-monasca-output` gem:

    gem build fluentd-monasca-output.gemspec
    gem install fluentd-monasca-output-<version>.gem
    td-agent-gem install fluentd-monasca-output

## Configuration
Example `td-agent.conf` configuration that forwards all logs to Monasca:

    <match *.**>
        type copy
        <store>
           @type monasca
           keystone_url <keystone URL>
           monasca_api <Monasca API URL>
           monasca_api_version v2.0
           username <username>
           password <password>
           domain_id <domain ID>
           project_name <project name>
        </store>
    </match>

Note that by default the `message` field is used to extract the log message, and all other fields are forwarded as dimensions. If the log message is extracted to a different field, for example the `Payload` field by Fluentd, this can be configured with the following config line:

    message_field_name Payload

Buffering of logs by default is to memory. Buffering settings are detailed in the [Fluent documentation](https://docs.fluentd.org/v/0.12/buffer/file). Example settings for buffering to file are given below:

    buffer_type file
    buffer_path /var/lib/fluentd/data/monasca.*.buffer
    max_retry_wait 10s

There is currently no support for looking up a logging endpoint from the Keystone catalogue.

## Changelog

### 1.0.0
 - Support posting logs to the unified Monasca API
 - Remove support for posting logs to Monasca Log API
