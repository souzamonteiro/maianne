/**
 * @license
 * Copyright 2020 Roberto Luiz Souza Monteiro,
 *                Renata Souza Barreto,
 *                Hernane Borges de Barros Pereira.
 *
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * MaiaNNE core class.
 * @class
 */
function MaiaNNE() {
    init();

    /**
     * Creates the attributes of the class.
     */
    function init() {
        // Class attributes goes here.
    }

    /**
     * Interpret the options passed on the command line,
     * process the files and generate the requested reports.
     */
    this.run = function() {
        // Supports only the Node.js interpreter.
        if (typeof process !== 'undefined') {
            var command = 'node';
            var argv = process.argv.slice();
            var fs = require('fs');
            var readTextFile = fs.readFileSync;

            // Read file callback.
            function read(input) {
                if (/^{.*}$/.test(input)) {
                    return input.substring(1, input.length - 1);
                } else {
                    var content = readTextFile(input, 'utf-8');
                    return content.length > 0 && content.charCodeAt(0) == 0xFEFF ? content.substring(1) : content;
                }
            }
            
            // Command line arguments.
            system.argv = argv.slice();
            system.argc = argv.length;

            // Command line options.
            var inputFile = '';
            var outputFile = '';
            var logFile = '';
            var columnSeparator = ',';

            // Get command line arguments.
            if (argv.length > 2) {
                var i = 2;
                while (i < argv.length) {
                    if (argv[i] == '-c') {
                        justCompile = true;
                    } else if ((argv[i] == '-h') | (argv[i] == '--help')) {
                        system.log('MaiaNNE Command Line Interface (CLI)');
                        system.log('Usage: maianne [options] [network.net] [--] [arguments]');
                        system.log('Options:');
                        system.log('-h     --help               Displays this help message;');
                        system.log('-l                          Log output file name;');
                        system.log('-o     [output.net]         Output network file name;');
                        system.log('-s                          Record column character separator (default=",");');
                        process.exit(0);
                    } else if (argv[i] == '-l') {
                        i++;
                        logFile = argv[i];
                    } else if (argv[i] == '-o') {
                        i++;
                        outputFile = argv[i];
                    } else if (argv[i] == '-s') {
                        i++;
                        columnSeparator = argv[i];
                    } else {
                        inputFile = argv[i];
                        break;
                    }
                    i++;
                }
                system.argv = argv.slice(i);
                system.argc = system.argv.length;

                if (inputFile != '') {
                    var Glob = require('glob');
                    // Process each file based on glob pattern.
                    function processFiles(er, files) {
                        if (files.length == 0) {
                            system.log('MaiaNNE Command Line Interface (CLI)');
                            system.log('Usage: maianne [options] [network.net] [--] [arguments]');
                        } else {
                        }
                    }

                    options = {};

                    // Get all file names based on glob pattern.
                    var glob = new Glob(inputFile, options, processFiles);
                } else {
                    if (!createGraph) {
                        system.log('MaiaNNE Command Line Interface (CLI)');
                        system.log('Usage: maianne [options] [network.net] [--] [arguments]');
                    }
                }
            } else {
                system.log('MaiaNNE Command Line Interface (CLI)');
                system.log('Usage: maianne [options] [network.net] [--] [arguments]');
            }
        }
    }
}

maianne = new MaiaNNE();

/*
 * Run LearningMatrix code if this script has been invoked
 * from the command line.
 */
if (typeof process !== 'undefined') {
    // Emulate DOM.
    const jsdom = require('jsdom');
    const {
        JSDOM
    } = jsdom;
    var doc = new JSDOM();
    var DOMParser = doc.window.DOMParser;

    var alert = system.log;

    learningmatrix.run();
}