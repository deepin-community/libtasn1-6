# Copyright (C) 2006-2022 Free Software Foundation, Inc.
old_NEWS_hash = 7552c904096db5eb5310051b1b7d8560
exclude_file_name_regexp--sc_prohibit_eol_brackets = ^(autogen.sh|autopull.sh|bootstrap-funclib.sh|tests/.*|fuzz/.*|bootstrap)$$
exclude_file_name_regexp--sc_makefile_DISTCHECK_CONFIGURE_FLAGS = ^Makefile.am$$
sc_libtool_version_bump:
	@git diff v$(PREV_VERSION).. | grep -q '^+AC_SUBST(LT'

review-tag ?= $(shell git describe --abbrev=0)
	git diff $(review-tag).. \
	| grep -v -e '^index' -e '^deleted file mode' -e '^new file mode' \
	| filterdiff -p 1 -x 'build-aux/*' -x 'lib/gl*' -x 'po/*' -x 'maint.mk' -x '.gitignore' -x '.gitlab-ci.yml' -x .prev-version -x autogen.sh -x autopull.sh -x bootstrap -x bootstrap-funclib.sh \