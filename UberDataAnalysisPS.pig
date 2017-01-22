Uber_int_data = load '/user/UBER/uber' using PigStorage (',') as (Dispatching_base_number:chararray,Date:chararray,No_available_veh:int,No_trips:int);
dump Uber_int_data;
Int_data_set1 = group Uber_int_data by Dispatching_base_number;
dump Int_data_set1;
Int_data_set2 = foreach Int_data_set1 generate group, SUM(Uber_int_data.No_trips);
Int_data_set3 = foreach Int_data_set1 generate group, SUM(Uber_int_data.No_available_veh);
dump Int_data_set2;
dump Int_data_set3;
Final_data1 = order Int_data_set2 by $1 desc;
Final_data2 = order Int_data_set3 by $1 desc;
Final_dis_data1 = limit Final_data1 3;
Final_dis_data2 = limit Final_data2 3;
STORE Final_dis_data1 INTO '/user/UBER/uber_out1' USING PigStorage (',');
STORE Final_dis_data2 INTO '/user/UBER/uber_out2' USING PigStorage (',');
dump Final_dis_data1;
dump Final_dis_data2;

