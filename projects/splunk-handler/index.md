---
layout: post
title: Splunk Handler
---

Splunk Handler is a Python logging handler that forwards Python application logs
to a Splunk Enterprise instance. The source is located on my
[GitHub](https://github.com/zach-taylor/splunk_handler). I created this as a personal
project because it was something that I needed for projects at work and school.

Splunk Handler uses [Splunk's Python SDK](https://github.com/splunk/splunk-sdk-python)
to interact with an Enterprise Splunk server via its REST API. Splunk Handler spawns
a new thread whenever it sends a log to the server so that the application does not
block during the HTTP request.

Technologies used:

- Python
- Python `logging` library
- Python `threading` library
- Splunk Enterprise
- Pypi open source package management platform

Since this is an open source project, I can continue to work on it and allows
others in the community to contribute as well.

## Installation

Pip:

    pip install splunk_handler

Manual:

    python setup.py install

## Usage

    from splunk_handler import SplunkHandler

Then use it like any other regular Python [logging handler](https://docs.python.org/2/howto/logging.html#handlers).

Example:

    import logging
    from splunk_handler import SplunkHandler

    splunk = SplunkHandler(
        host='splunk.example.com',
        port='8089',
        username='username',
        password='password',
        index='main'
    )

    logging.getLogger('').addHandler(splunk)

    logging.info('hello!')

I would recommend using a JSON formatter with this to receive your logs in JSON format.
Here is an open source one: https://github.com/madzak/python-json-logger


## Contributing

Feel free to contribute an issue or pull request:

1. Check for existing issues and PRs
2. Fork the repo, and clone it locally
3. Create a new branch for your contribution
4. Push to your fork and submit a pull request

## License

This project is licensed under the terms of the [MIT license](http://opensource.org/licenses/MIT).
