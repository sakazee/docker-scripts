
# 🧹 Docker Safe Cleanup Guide

This guide explains a safe way to clean Docker without deleting important data.

The script is designed with a **safe first approach**.
It checks usage first, then removes only unnecessary junk.

---

## 🚀 Step 1: Create the script file

Run this command:

```bash
nano docker-safe-clean.sh
````

---

## 🧾 Step 2: Paste this script

```bash
#!/bin/bash

echo "=============================="
echo " 🐳 Docker Safe Cleanup Started "
echo "=============================="

echo ""

echo "📊 [1] Docker disk usage BEFORE:"
docker system df

echo ""

echo "🧹 [2] Removing stopped containers..."
docker container prune -f

echo ""

echo "🌐 [3] Removing unused networks..."
docker network prune -f

echo ""

echo "🖼️ [4] Removing dangling images (SAFE)..."
docker image prune -f

echo ""

echo "⚙️ [5] Removing build cache..."
docker builder prune -f

echo ""

echo "=============================="
echo " ⚠️ IMPORTANT: Volumes are NOT touched "
echo " This prevents data loss "
echo "=============================="

echo ""

echo "📊 [6] Docker disk usage AFTER:"
docker system df

echo ""

echo "✅ DONE."
```

---

## 💾 Step 3: Save and exit

Press:

* CTRL + O then Enter
* CTRL + X

---

## 🔐 Step 4: Give permission

```bash
chmod +x docker-safe-clean.sh
```

---

## ▶️ Step 5: Run the script

```bash
./docker-safe-clean.sh
```

---

## 🔥 What this script does

### ✅ Safe cleanup actions

* 🧹 Removes stopped containers
* 🌐 Removes unused networks
* 🖼️ Removes dangling images
* ⚙️ Cleans build cache

---

## ❌ What this script does NOT do

* 🚫 Does NOT delete volumes
* 🚫 Does NOT touch running containers
* 🚫 Does NOT remove database data

So this is safe for production use.

---

## 📉 Expected space savings

Depends on your system:

* Images cleanup: ~4.8GB or more
* Cache and containers: small to medium

👉 Total possible free space: **5GB to 15GB**

---

## ⚠️ Important note

Your main disk issue is usually NOT Docker junk.

👉 Most space often comes from volume data like database dumps.

This script intentionally avoids touching that data.


