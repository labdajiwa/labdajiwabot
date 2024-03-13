SHELL := /bin/bash
PYTHON = ${HOME}/.pyvenv/bin/python3
PWB = /data/project/shared/pywikibot/stable/pwb.py
CFG = ${HOME}/.pywikibot

jvwiki-purge-cache:
	@cp -f "$(CFG)/user-jvwiki-config.py" "$(CFG)/user-config.py"
	$(PYTHON) $(PWB) login
	$(PYTHON) $(PWB) touch -purge \
		-page:"Wikipédia:Pendhapa" \
		-page:"Wikipédia:Angkringan"

jvwikt-jvws-purge-cache:
	@cp -f "$(CFG)/user-jvwikt-config.py" "$(CFG)/user-config.py"
	$(PYTHON) $(PWB) login
	$(PYTHON) $(PWB) touch -purge -page:"Wikisastra:Pendhapa"
	@cp -f "$(CFG)/user-jvws-config.py" "$(CFG)/user-config.py"
	$(PYTHON) $(PWB) login
	$(PYTHON) $(PWB) touch -purge -page:"Wikisumber:Pendhapa"

jvwiki-archive:
	@cp -f "$(CFG)/user-jvwiki-config.py" "$(CFG)/user-config.py"
	$(PYTHON) $(PWB) login
	$(PYTHON) $(PWB) archivebot "Naraguna:LabdajiwaBot/konfig arsip"

install-venv:
	python3 -m venv .pyvenv
	source .pyvenv/bin/activate
	$(PYTHON) -m pip install -U pip
	# Packages for Pywikibot.
	$(PYTHON) -m pip install mwparserfromhell packaging requests requests-oauthlib setuptools

uninstall-venv:
	rm -rf "${HOME}/.cache/pip"
	rm -rf "${HOME}/.pyvenv"
