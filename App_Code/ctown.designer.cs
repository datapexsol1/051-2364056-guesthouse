﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="guest_house_database")]
public partial class ctownDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertlogin(login instance);
  partial void Updatelogin(login instance);
  partial void Deletelogin(login instance);
  partial void Insertemployee(employee instance);
  partial void Updateemployee(employee instance);
  partial void Deleteemployee(employee instance);
  #endregion
	
	public ctownDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["guest_house_databaseConnectionString"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public ctownDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public ctownDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public ctownDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public ctownDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<login> logins
	{
		get
		{
			return this.GetTable<login>();
		}
	}
	
	public System.Data.Linq.Table<employee> employees
	{
		get
		{
			return this.GetTable<employee>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.login")]
public partial class login : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _Id;
	
	private string _username;
	
	private string _password;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIdChanging(int value);
    partial void OnIdChanged();
    partial void OnusernameChanging(string value);
    partial void OnusernameChanged();
    partial void OnpasswordChanging(string value);
    partial void OnpasswordChanged();
    #endregion
	
	public login()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Id", DbType="Int NOT NULL", IsPrimaryKey=true)]
	public int Id
	{
		get
		{
			return this._Id;
		}
		set
		{
			if ((this._Id != value))
			{
				this.OnIdChanging(value);
				this.SendPropertyChanging();
				this._Id = value;
				this.SendPropertyChanged("Id");
				this.OnIdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_username", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string username
	{
		get
		{
			return this._username;
		}
		set
		{
			if ((this._username != value))
			{
				this.OnusernameChanging(value);
				this.SendPropertyChanging();
				this._username = value;
				this.SendPropertyChanged("username");
				this.OnusernameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_password", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string password
	{
		get
		{
			return this._password;
		}
		set
		{
			if ((this._password != value))
			{
				this.OnpasswordChanging(value);
				this.SendPropertyChanging();
				this._password = value;
				this.SendPropertyChanged("password");
				this.OnpasswordChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.employee")]
public partial class employee : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _Id;
	
	private string _name;
	
	private string _email;
	
	private string _employee_no;
	
	private string _cnic;
	
	private string _designation;
	
	private System.Data.Linq.Binary _image;
	
	private string _branch_id;
	
	private System.Nullable<int> _block_client;
	
	private string _username;
	
	private string _password;
	
	private string _login_type;
	
	private System.Nullable<System.DateTime> _dateofjoining;
	
	private string _address;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnIdChanging(int value);
    partial void OnIdChanged();
    partial void OnnameChanging(string value);
    partial void OnnameChanged();
    partial void OnemailChanging(string value);
    partial void OnemailChanged();
    partial void Onemployee_noChanging(string value);
    partial void Onemployee_noChanged();
    partial void OncnicChanging(string value);
    partial void OncnicChanged();
    partial void OndesignationChanging(string value);
    partial void OndesignationChanged();
    partial void OnimageChanging(System.Data.Linq.Binary value);
    partial void OnimageChanged();
    partial void Onbranch_idChanging(string value);
    partial void Onbranch_idChanged();
    partial void Onblock_clientChanging(System.Nullable<int> value);
    partial void Onblock_clientChanged();
    partial void OnusernameChanging(string value);
    partial void OnusernameChanged();
    partial void OnpasswordChanging(string value);
    partial void OnpasswordChanged();
    partial void Onlogin_typeChanging(string value);
    partial void Onlogin_typeChanged();
    partial void OndateofjoiningChanging(System.Nullable<System.DateTime> value);
    partial void OndateofjoiningChanged();
    partial void OnaddressChanging(string value);
    partial void OnaddressChanged();
    #endregion
	
	public employee()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Id", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int Id
	{
		get
		{
			return this._Id;
		}
		set
		{
			if ((this._Id != value))
			{
				this.OnIdChanging(value);
				this.SendPropertyChanging();
				this._Id = value;
				this.SendPropertyChanged("Id");
				this.OnIdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_name", DbType="NVarChar(25) NOT NULL", CanBeNull=false)]
	public string name
	{
		get
		{
			return this._name;
		}
		set
		{
			if ((this._name != value))
			{
				this.OnnameChanging(value);
				this.SendPropertyChanging();
				this._name = value;
				this.SendPropertyChanged("name");
				this.OnnameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_email", DbType="NVarChar(25) NOT NULL", CanBeNull=false)]
	public string email
	{
		get
		{
			return this._email;
		}
		set
		{
			if ((this._email != value))
			{
				this.OnemailChanging(value);
				this.SendPropertyChanging();
				this._email = value;
				this.SendPropertyChanged("email");
				this.OnemailChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_employee_no", DbType="NVarChar(25) NOT NULL", CanBeNull=false)]
	public string employee_no
	{
		get
		{
			return this._employee_no;
		}
		set
		{
			if ((this._employee_no != value))
			{
				this.Onemployee_noChanging(value);
				this.SendPropertyChanging();
				this._employee_no = value;
				this.SendPropertyChanged("employee_no");
				this.Onemployee_noChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_cnic", DbType="NVarChar(25) NOT NULL", CanBeNull=false)]
	public string cnic
	{
		get
		{
			return this._cnic;
		}
		set
		{
			if ((this._cnic != value))
			{
				this.OncnicChanging(value);
				this.SendPropertyChanging();
				this._cnic = value;
				this.SendPropertyChanged("cnic");
				this.OncnicChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_designation", DbType="NVarChar(25) NOT NULL", CanBeNull=false)]
	public string designation
	{
		get
		{
			return this._designation;
		}
		set
		{
			if ((this._designation != value))
			{
				this.OndesignationChanging(value);
				this.SendPropertyChanging();
				this._designation = value;
				this.SendPropertyChanged("designation");
				this.OndesignationChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_image", DbType="VarBinary(MAX)", UpdateCheck=UpdateCheck.Never)]
	public System.Data.Linq.Binary image
	{
		get
		{
			return this._image;
		}
		set
		{
			if ((this._image != value))
			{
				this.OnimageChanging(value);
				this.SendPropertyChanging();
				this._image = value;
				this.SendPropertyChanged("image");
				this.OnimageChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_branch_id", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string branch_id
	{
		get
		{
			return this._branch_id;
		}
		set
		{
			if ((this._branch_id != value))
			{
				this.Onbranch_idChanging(value);
				this.SendPropertyChanging();
				this._branch_id = value;
				this.SendPropertyChanged("branch_id");
				this.Onbranch_idChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_block_client", DbType="Int")]
	public System.Nullable<int> block_client
	{
		get
		{
			return this._block_client;
		}
		set
		{
			if ((this._block_client != value))
			{
				this.Onblock_clientChanging(value);
				this.SendPropertyChanging();
				this._block_client = value;
				this.SendPropertyChanged("block_client");
				this.Onblock_clientChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_username", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string username
	{
		get
		{
			return this._username;
		}
		set
		{
			if ((this._username != value))
			{
				this.OnusernameChanging(value);
				this.SendPropertyChanging();
				this._username = value;
				this.SendPropertyChanged("username");
				this.OnusernameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_password", DbType="NVarChar(50) NOT NULL", CanBeNull=false)]
	public string password
	{
		get
		{
			return this._password;
		}
		set
		{
			if ((this._password != value))
			{
				this.OnpasswordChanging(value);
				this.SendPropertyChanging();
				this._password = value;
				this.SendPropertyChanged("password");
				this.OnpasswordChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_login_type", DbType="NVarChar(50)")]
	public string login_type
	{
		get
		{
			return this._login_type;
		}
		set
		{
			if ((this._login_type != value))
			{
				this.Onlogin_typeChanging(value);
				this.SendPropertyChanging();
				this._login_type = value;
				this.SendPropertyChanged("login_type");
				this.Onlogin_typeChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_dateofjoining", DbType="DateTime")]
	public System.Nullable<System.DateTime> dateofjoining
	{
		get
		{
			return this._dateofjoining;
		}
		set
		{
			if ((this._dateofjoining != value))
			{
				this.OndateofjoiningChanging(value);
				this.SendPropertyChanging();
				this._dateofjoining = value;
				this.SendPropertyChanged("dateofjoining");
				this.OndateofjoiningChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_address", DbType="VarChar(150)")]
	public string address
	{
		get
		{
			return this._address;
		}
		set
		{
			if ((this._address != value))
			{
				this.OnaddressChanging(value);
				this.SendPropertyChanging();
				this._address = value;
				this.SendPropertyChanged("address");
				this.OnaddressChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}
#pragma warning restore 1591
