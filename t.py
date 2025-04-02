"""Utilities for managing Python module reloading."""

# This module is kept outside of the `st` namespace as it allow us to easily
# run `forget("st")` without loosing the reference to the `forget` function.

from __future__ import annotations

import logging
import sys
import types

__all__ = ["forget"]


# Ensure the logger inherits the configuration
# of the `st` namespace, even if it's not part of it.
_logger = logging.getLogger("st.lib.forget")


def forget(module: str) -> None:
    """Remove a module and all of its submodules from [`sys.modules`][].

    The argument must be an [`#!python str`][str] object in the same form as it
    would have been specified in an `import` statement.

    Any external module holding a reference to an object from one of the
    forgotten module will retain the old reference.  To avoid inconsistencies,
    ensure that all dependent modules are also forgotten.

    Examples:
        >>> forget("foo")
        >>> forget("foo.bar")

    Warning:
        Do not use this function in any python module.

        This should only be used in interactive python session during
        dev/debug process.
    """
    if not isinstance(module, str):
        msg = f"expected str, not {type(module).__name__}"
        if isinstance(module, types.ModuleType):
            msg += f". Did you mean: `forget({module.__name__!r})`?"
        raise TypeError(msg)

    removed = 0
    for name in sorted(sys.modules.copy()):
        if module == name or name.startswith(module + "."):
            del sys.modules[name]
            removed += 1
            _logger.debug("`%s` removed from sys.modules", name)

    _logger.info("%d module(s) have been removed from sys.modules", removed)
