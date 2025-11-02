#!/bin/bash
# MCP Test Script - Check welke MCP servers beschikbaar zijn

echo "🔍 Testing MCP Server Availability"
echo "===================================="
echo ""

# Test 1: Memory MCP
echo "1️⃣ Testing Memory MCP..."
echo "   Expected: mcp__memory__* tools available"
echo ""

# Test 2: Sequential Thinking MCP
echo "2️⃣ Testing Sequential Thinking MCP..."
echo "   Expected: mcp__sequential-thinking__* tools available"
echo ""

# Test 3: Brave Search MCP
echo "3️⃣ Testing Brave Search MCP..."
if [ -z "$BRAVE_API_KEY" ]; then
  echo "   ⚠️  WARNING: BRAVE_API_KEY not set"
  echo "   Set: export BRAVE_API_KEY=your-key"
else
  echo "   ✅ BRAVE_API_KEY is set"
fi
echo ""

# Test 4: PostgreSQL MCP
echo "4️⃣ Testing PostgreSQL MCP..."
if [ -z "$DATABASE_URL" ]; then
  echo "   ⚠️  WARNING: DATABASE_URL not set"
  echo "   Set: export DATABASE_URL=postgresql://user:pass@localhost:5432/dbname"
else
  echo "   ✅ DATABASE_URL is set"
fi
echo ""

# Test 5: Sentry MCP
echo "5️⃣ Testing Sentry MCP..."
if [ -z "$SENTRY_DSN" ] || [ -z "$SENTRY_ORG" ] || [ -z "$SENTRY_PROJECT" ] || [ -z "$SENTRY_AUTH_TOKEN" ]; then
  echo "   ⚠️  WARNING: Sentry environment variables not complete"
  echo "   Required: SENTRY_DSN, SENTRY_ORG, SENTRY_PROJECT, SENTRY_AUTH_TOKEN"
else
  echo "   ✅ All Sentry environment variables set"
fi
echo ""

# Test 6: Docker MCP
echo "6️⃣ Testing Docker MCP..."
if command -v docker &> /dev/null; then
  echo "   ✅ Docker CLI available"
  docker ps &> /dev/null
  if [ $? -eq 0 ]; then
    echo "   ✅ Docker daemon running"
  else
    echo "   ⚠️  Docker daemon not running or permission denied"
  fi
else
  echo "   ❌ Docker CLI not found"
fi
echo ""

# Test 7: Git MCP
echo "7️⃣ Testing Git MCP..."
if command -v git &> /dev/null; then
  echo "   ✅ Git CLI available"
else
  echo "   ❌ Git CLI not found"
fi
echo ""

# Test 8: Playwright MCP
echo "8️⃣ Testing Playwright MCP..."
echo "   ℹ️  Playwright will auto-install on first use via npx"
echo ""

echo "===================================="
echo "✅ MCP Configuration check complete"
echo ""
echo "To test MCP tools in Claude, use:"
echo "  - mcp__memory__create_entities"
echo "  - mcp__brave_search__brave_web_search"
echo "  - mcp__postgres__query (if DATABASE_URL set)"
echo "  - etc."
