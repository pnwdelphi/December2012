object ServerContainer2: TServerContainer2
  OldCreateOrder = False
  DisplayName = 'ServerContainer2'
  OnStart = ServiceStart
  Height = 271
  Width = 415
  object DSServer1: TDSServer
    Left = 96
    Top = 11
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    PoolSize = 0
    Server = DSServer1
    Filters = <>
    Left = 96
    Top = 73
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    Left = 200
    Top = 11
  end
  object sqlcEMPLOYEE: TSQLConnection
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
    Left = 206
    Top = 73
  end
  object dsCOUNTRY: TSQLDataSet
    CommandText = 'COUNTRY'
    CommandType = ctTable
    DbxCommandType = 'Dbx.Table'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlcEMPLOYEE
    Left = 208
    Top = 127
  end
end
