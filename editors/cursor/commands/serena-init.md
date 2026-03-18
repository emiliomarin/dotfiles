# Serena: init & index

You are Cursor Agent with access to the project’s terminal and files.

Goal: (re)initialize Serena for THIS repository and rebuild its index so the
Serena MCP tools have an up-to-date `.serena` folder.

**What to do:**

1. Work from the project root (where this `.cursor` folder lives).

2. In the integrated terminal, run these commands, in order:

```bash
   uvx --from git+https://github.com/oraios/serena serena project create .
```
Then:

```bash
uvx --from git+https://github.com/oraios/serena serena project index
```

