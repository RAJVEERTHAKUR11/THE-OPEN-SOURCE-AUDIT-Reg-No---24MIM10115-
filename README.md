# OSS Audit — Python
**Course:** Open Source Software | VIT Bhopal  
**Student Name:** [RAJVEER THAKUR ]  
**Roll Number:** [24MIM10115]  
**Chosen Software:** Python (PSF License)

---

## About This Project

Inside this folder sit five shell scripts built for the Open Source Audit final task. Python serves as the selected tool - a freely available, collaboratively shaped coding language distributed via the PSF License.

---

## Scripts Overview

Script File Functions Explained
|--------|------|--------------|
Linux details appear through script1_system_identity.sh - view kernel version alongside distribution name. This tool shows active user plus how long the machine has run. Time stamps display current date together with system startup moment. Information includes Python licensing terms as part of output. Data lines form a compact snapshot without extra formatting
A script begins by inspecting whether Python exists on the system. When found, it reveals the version currently active. Information about available packages follows next. A brief reflection on programming principles appears afterward. This message displays through conditional logic. Each outcome directs its own response. The structure uses a case construct to manage flow. Details emerge only when relevant. Execution ends once all steps finish
One way to begin is by scanning core folders - spotting who owns what, how files are set up, their access rules, space taken. Python areas get extra attention during this sweep. What happens next involves comparing actual settings against expected norms. A look at storage patterns shows where bulk sits. Ownership mismatches pop up when users shift over time. Permissions sometimes drift from original intent. This process runs without needing constant oversight. Findings come together in a structured report. Checks repeat under consistent conditions. Details matter most when tracking down odd behavior. System health ties closely to these baseline traits.
A script processes server logs by scanning for specific terms. Following that, frequency of each term gets tallied automatically. After counting finishes, it displays only the most recent five entries containing those keywords. Processing stops once output appears on screen. No additional steps occur beyond showing results.
A single question begins the process, followed by two more that shape direction. One after another, they pull ideas into focus. The responses combine, forming a statement unique to the user. This output gets written directly into a text document. A shell script handles the flow, named for its purpose. Questions appear only when needed, keeping things moving. After completion, the file remains ready for use or sharing

---

##  Running Scripts on Linux

### Begin with granting execution permission to every script (single occurrence)
```bash
chmod +x script1_system_identity.sh
chmod +x script2_package_inspector.sh
chmod +x script3_disk_auditor.sh
chmod +x script4_log_analyzer.sh
chmod +x script5_manifesto_generator.sh
```

### System Identity Report Script One
```bash
./script1_system_identity.sh
```
Just facts here. System details appear alongside the Python license notice.

### Foss package inspector script two
```bash
./script2_package_inspector.sh
```
One glance says it all. When a python3 package is present, information about it appears on screen.

### Script Three Disk and Permission Checker
```bash
./script3_disk_auditor.sh
```
### Just skip the debate. For certain folder amounts, administrative rights might be necessary
```bash
sudo ./script3_disk_auditor.sh
```

### Log File Analyzer Script Four
```bash
./script4_log_analyzer.sh /var/log/syslog error
```
### Arguments:
- `$1` - Path to log file (e.g. `/var/log/syslog`)
Searching begins with a keyword; by default, it uses "error" if nothing else is given. The value `$2` sets that term when provided

### Example with custom keyword:
```bash
./script4_log_analyzer.sh /var/log/syslog warning
```

Script Five Manifesto Generator
```bash
./script5_manifesto_generator.sh
```
A series of three prompts appears, one after another. Responses get stored automatically in a file named manifesto_[username].txt.

---

## Dependencies

Dependency Purpose Install Command
|------------|---------|-----------------|
A shell environment executes each script sequentially. Most machines include this tool by default. Linux distributions ship with it already present.
Using Python 3 begins with checking what packages are present. One way to view installed components is through a system command. Installation on Debian-based systems uses the apt tool. Type sudo apt install python3 to add it if missing.
The lsb_release command identifies the Linux distribution. Script 1 uses it to detect system details. Installation requires running sudo apt install lsb-release. This package provides consistent release information across systems. Without it, scripts may fail to recognize the OS version correctly.
The dpkg tool handles package verification in script two. It comes already present in Debian-based systems like Ubuntu. One finds it ready to use upon installation of such operating systems.

All scripts come designed around Ubuntu or Debian Linux systems. When working on CentOS or Fedora, make sure to swap `dpkg` for `rpm` within Script 2.

---

## Repository Structure
```
oss-audit-[rollnumber]/
├── script1_system_identity.sh
├── script2_package_inspector.sh
├── script3_disk_auditor.sh
├── script4_log_analyzer.sh
├── script5_manifesto_generator.sh
└── README.md
```
