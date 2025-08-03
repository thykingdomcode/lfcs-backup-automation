# 🛡️ Linux Backup & Restore Automation Project

This project is a fully automated backup system created to demonstrate practical Linux administration skills aligned with the **LFCS (Linux Foundation Certified System Administrator)** certification.

It covers real-world sysadmin tasks such as file backup, encryption, cloud storage integration, monitoring, logging, and restore — all using native Linux tools and automation via Bash scripting and cron.

---

## 📦 Features

- ✅ Timestamped compression using `tar` and `gzip`
- ✅ AES-256 encryption using GPG (`gpg --symmetric`)
- ✅ Upload to Azure Blob Storage via `azcopy`
- ✅ Email notifications using `mailx` and `postfix`
- ✅ Azure Log Analytics integration for centralized logging
- ✅ Full restore workflow: download → decrypt → extract → verify
- ✅ Daily scheduled automation using `cron`
- ✅ Git version-controlled with meaningful commit history

---

## 📁 Folder Structure

```
backup-project/
├── backup.sh               # Main backup script
├── run_backup.sh           # Wrapper script for cron automation
├── send_log_to_azure.sh    # Script to upload logs to Azure Monitor
├── backup.log              # Local backup log file
├── backups/                # (Runtime) Encrypted backup files stored here
├── restores/               # (Runtime) Used during restore testing
```

Note: `backups/` and `restores/` are created by the scripts and may not appear in GitHub unless a file is inside.

---

## 🚀 How to Use

### Manual Backup
```bash
./backup.sh your_passphrase
```

### Restore from Azure
```bash
# Download
azcopy copy "https://<your-storage>.blob.core.windows.net/backups/<filename>.gpg" ~/backup-project/restores/

# Decrypt
cd ~/backup-project/restores
gpg --batch --yes --passphrase "your_passphrase" -o restored_backup.tar.gz -d <filename>.gpg

# Extract
tar -xzf restored_backup.tar.gz -C ./restored_data

# Verify
diff -r ./restored_data ~/backup-project/data
```

### Automate with Cron
```bash
crontab -e
```

Add this line to run the backup every day at 2 AM:
```
0 2 * * * /home/yourusername/backup-project/run_backup.sh >> /home/yourusername/backup-project/cron.log 2>&1
```

---

## 🔧 Tools Used

- `bash`
- `tar`, `gzip`
- `gpg` for encryption
- `azcopy` for Azure Blob Storage
- `mailx` + `postfix` for email alerts
- `cron` for scheduling
- Azure Log Analytics via `curl`

---

## 📌 Project Phases (Each Git-Tracked)

1. Archiving with `tar`
2. GPG encryption
3. Cloud upload with AzCopy
4. Email notifications
5. Azure log monitoring
6. Full restore testing
7. Cron-based automation
8. End-to-end verification

Each milestone is committed in Git with clear, descriptive messages.

---

## 🔒 Ignored & Excluded Files (Security-Conscious Practice)

Although this project does **not contain real sensitive data**, all backup-related files are excluded from version control to demonstrate good cybersecurity and Git hygiene practices.

These ignored files include:

- ✅ `backups/*.tar.gz` — compressed archive outputs  
- ✅ `backups/*.gpg` — encrypted backups using GPG  
- ✅ `backup.log` — runtime logging output  
- ✅ Temporary files like `*.swp`, `*.tmp`, etc.

Some `.tar.gz` files may appear in **early phases (e.g., Phase 2)** for demonstration only.  
All other output files are intentionally excluded using `.gitignore`.

> 🧠 Treating output as sensitive — even when it's not — reflects real-world awareness of data protection and clean Git workflows.

View the full ignore list in [`.gitignore`](./.gitignore).

---

## 💼 Why This Project Matters

This project was built as part of my LFCS training and demonstrates:

- Linux scripting and file management
- Automation and secure backup practices
- Real-world cloud integration
- Logging, alerts, and monitoring
- Git-based workflow and documentation

It’s designed to reflect production-grade sysadmin responsibilities — and show I can build reliable tools from scratch.

---

## 📸 Screenshots (Project Output Preview)

This section will include visual proof of each backup and restore step.

| Step | Description | Screenshot |
|------|-------------|------------|
| 1️⃣  | Archive created with `tar` | _📷 Placeholder — coming soon_ |
| 2️⃣  | Encrypted using GPG (`--symmetric`, AES256) | _📷 Placeholder — coming soon_ |
| 3️⃣  | Uploaded to Azure with `azcopy` | _📷 Placeholder — coming soon_ |
| 4️⃣  | Email notification sent | _📷 Placeholder — coming soon_ |
| 5️⃣  | Log output written to `backup.log` | _📷 Placeholder — coming soon_ |
| 6️⃣  | Restore: decrypt + extract | _📷 Placeholder — coming soon_ |
| 7️⃣  | Verified output using `diff` | _📷 Placeholder — coming soon_ |

> ✅ Screenshots will be added gradually as each phase is implemented and tested.

---

## 👋 About Me

I'm currently studying for the LFCS certification and building projects that reflect real-world Linux system administration and DevOps practices.

Feel free to explore the code or reach out with feedback!

