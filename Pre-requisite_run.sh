# Copy the uber input file to home working directory

# Run the foloowing commands

hadoop fs -mkdir /user/UBER
hadoop fs -put uber /user/UBER/

# To ensure the success of file transfer

hadoop fs -ls /user/UBER/