object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 213
  Width = 215
  object EMPLOYEE: TSQLConnection
    ConnectionName = 'EMPLOYEE'
    DriverName = 'Interbase'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      
        'Database=localhost:C:\ProgramData\Embarcadero\InterBase\gds_db\e' +
        'xamples\database\employee.gdb'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Connected = True
    Left = 21
    Top = 13
  end
  object sqldCountry: TSQLDataSet
    CommandText = 'COUNTRY'
    CommandType = ctTable
    DbxCommandType = 'Dbx.Table'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = EMPLOYEE
    Left = 24
    Top = 69
  end
  object dspCountry: TDataSetProvider
    DataSet = sqldCountry
    Left = 104
    Top = 72
  end
  object sqldEmployee: TSQLDataSet
    CommandText = 'EMPLOYEE'
    CommandType = ctTable
    DbxCommandType = 'Dbx.Table'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = EMPLOYEE
    Left = 24
    Top = 136
  end
  object dspEmployee: TDataSetProvider
    DataSet = sqldEmployee
    Left = 104
    Top = 136
  end
end
