#!/bin/bash

pre-commit run
pre-commit run ruff --all-files --show-diff-on-failure
pre-commit run black --all-files --show-diff-on-failure
