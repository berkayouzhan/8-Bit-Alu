cd /home/runner
export PATH=/usr/bin:/bin:/tool/pandora64/bin:/usr/local/bin
export YOSYS_HOME=/usr/local
export HOME=/home/runner
yosys -o synth.v -p hierarchy -p proc -p opt -p memory -p opt -p fsm -p opt -f verilog design.sv 2>&1 | awk '/^[0-9]+\. / { lines = 100; } /^[0-9]+\.[0-9]+\. / { lines = lines > 10 ? lines : 10; } { if (--lines > 0) print; if (lines == 0) print "[ ... ]\n"; } /READY\./ { if (lines <= 0) print; }' ; echo 'Creating result.zip...' && zip -r /tmp/tmp_zip_file_123play.zip . && mv /tmp/tmp_zip_file_123play.zip result.zip