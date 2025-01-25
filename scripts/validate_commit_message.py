#!/usr/bin/env python3
# scripts/validate_commit_message.py
#
# This script enforces conventional commit message format
# Format: type(scope): description
# Example: feat(core): add new AWS organization structure

import sys
import re
from typing import Tuple, Optional

def validate_commit_message(message: str) -> Tuple[bool, Optional[str]]:
    """
    Validates commit message against conventional commit standards.

    Args:
        message: The commit message to validate

    Returns:
        Tuple of (is_valid, error_message)
    """
    # Define valid commit types
    valid_types = [
        'feat',     # New feature
        'fix',      # Bug fix
        'docs',     # Documentation changes
        'style',    # Code style changes (formatting, missing semi colons, etc)
        'refactor', # Code changes that neither fix bugs nor add features
        'test',     # Adding missing tests or correcting existing tests
        'chore',    # Changes to build process or auxiliary tools
        'perf',     # Performance improvements
        'ci',       # CI/CD related changes
        'revert'    # Revert a previous commit
    ]

    # Regular expression for conventional commits
    pattern = rf"^({'|'.join(valid_types)})(\([a-z0-9-]+\))?: .+"

    # Get the first line of the commit message
    first_line = message.strip().split('\n')[0]

    # Check if message matches the pattern
    if not re.match(pattern, first_line):
        error_msg = f"""
Invalid commit message format.

Correct format: type(scope): description
Valid types: {', '.join(valid_types)}

Examples:
- feat(auth): implement JWT authentication
- fix(core): resolve memory leak in worker
- docs(api): update endpoint documentation
- style(lint): apply prettier formatting
"""
        return False, error_msg

    # Check message length
    if len(first_line) > 72:
        return False, "Commit message line is too long (max 72 characters)"

    return True, None

if __name__ == "__main__":
    # Read commit message file provided by Git
    commit_msg_file = sys.argv[1]
    with open(commit_msg_file, 'r', encoding='utf-8') as f:
        commit_message = f.read()

    # Validate the message
    is_valid, error_message = validate_commit_message(commit_message)

    if not is_valid:
        print(error_message)
        sys.exit(1)

    sys.exit(0)
