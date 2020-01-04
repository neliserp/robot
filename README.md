# Neliserp Robot

Test cases for front-end of Neliserp.

## Requirements
To run this test cases, you need to install robot framework and selenium library.

## Installation

Install Robot Framework
```console
$ pip install robotframework
```

Install Selenium Library
```console
$ pip install --upgrade robotframework-seleniumlibrary
```

Install Browser Driver
```console
$ pip install webdrivermanager
$ webdrivermanager firefox chrome --linkpath /usr/local/bin
```

Run `git clone` the software.

```console
$ git clone https://github.com/neliserp/robot
```

(optional) Edit application variable in file `resource.robot`

```console
$ vi resource.robot
${SERVER}         127.0.0.1:8000
${BROWSER}        Chrome
${DELAY}          0.3
${VALID_USER}     admin
${VALID_PASSWORD}    admin
${LOGIN_URL}      http://${SERVER}/login
${HOME_URL}    http://${SERVER}/
```

## Execution
Run all test cases in the folder

```console
$ robot .
```

Run test cases in folder xxx

```console
$ robot xxx
```

Run test cases in file xxx

```console
$ robot xxx.robot
```

## License

Neliserp is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT).
