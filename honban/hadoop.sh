#!/bin/sh

hadoop fs -rm -r output
hadoop fs -put moz_places.csv ./moz_places.csv
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming-2.0.0-cdh4.5.0.jar \
-input /user/shunsuke/moz_places.csv \
-output /user/shunsuke/output \
-numReduceTasks 16 \
-mapper mapper.rb \
-reducer reducer.rb \
-file "./mapper.rb" \
-file "./reducer.rb"
