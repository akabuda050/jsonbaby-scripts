init:
	@rm -rf php-package-template-installer
	@docker run --rm \
	 --interactive \
	 --user 1000:1000 \
	 --tty \
	 --volume ${PWD}:/app composer create-project jsonbaby/php-package-template-installer

install:
	@docker run --rm \
	 --interactive \
	 --user 1000:1000 \
	 --tty \
	 --volume ${PWD}/php-package-template-installer:/app composer ./bin/jsonbaby-php

test-generated:
	@docker run --rm \
	 --interactive \
	 --user 1000:1000 \
	 --tty \
	 --volume ${PWD}/php-package-template-installer/generated:/app composer install

	@docker run --rm \
	 --interactive \
	 --user 1000:1000 \
	 --tty \
	 --volume ${PWD}/php-package-template-installer/generated:/app composer test

	@docker run --rm \
	 --interactive \
	 --tty \
	 --volume ${PWD}/php-package-template-installer/generated:/app \
	 composer psalm	 
