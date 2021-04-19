df = importdata('export_df.csv');
df1 = importdata('export_df1.csv');
df2 = importdata('export_df2.csv');

omega1 = importdata('new_data1.csv');
omega2 = importdata('new_data2.csv');

df_Omega1 = df.*omega1;
df_Omega2 = df.*omega2;

maxiter = 100;

