unit BI.VCL.Editor.Query;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, BI.VCL.Grid, Vcl.ComCtrls,
  BI.Data, BI.Summary, BI.DataSource, BI.VCL.DataSelect, Vcl.StdCtrls, BI.Query,
  VCL.CheckLst, Vcl.Buttons;

type
  TBIQueryEditor = class(TForm)
    PanelSelector: TPanel;
    PanelEdit: TPanel;
    BIGrid1: TBIGrid;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    PanelRows: TPanel;
    PanelColumns: TPanel;
    PanelMeasures: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ListRows: TCheckListBox;
    ListMeasures: TCheckListBox;
    ListColumns: TCheckListBox;
    Panel4: TPanel;
    CBDistinct: TCheckBox;
    Panel5: TPanel;
    Panel7: TPanel;
    BDeleteColumn: TButton;
    PageMeasures: TPageControl;
    TabMeasure: TTabSheet;
    CBAggregate: TComboBox;
    CBMissingAsZero: TCheckBox;
    TabCalc: TTabSheet;
    RGRunning: TRadioGroup;
    CBRunningRows: TCheckBox;
    RGPercentage: TRadioGroup;
    TabMeasureInfo: TTabSheet;
    Label4: TLabel;
    LabelMeasureKind: TLabel;
    Label5: TLabel;
    LMeasureError: TLabel;
    EMeasureExpression: TEdit;
    CBRemoveRows: TCheckBox;
    CBRemoveCols: TCheckBox;
    PanelButtons: TPanel;
    Panel9: TPanel;
    BOK: TButton;
    Button1: TButton;
    LMax: TLabel;
    EMax: TEdit;
    PanelFilter: TPanel;
    EFilter: TEdit;
    CBFilter: TCheckBox;
    Label1: TLabel;
    BDeleteMeasure: TButton;
    Label2: TLabel;
    BDeleteRow: TButton;
    PageOptions: TPageControl;
    TabItem: TTabSheet;
    TabMeasureOptions: TTabSheet;
    Label3: TLabel;
    CBDatePart: TComboBox;
    GBHistogram: TGroupBox;
    CBHistoActive: TCheckBox;
    SBRowUp: TSpeedButton;
    SBRowDown: TSpeedButton;
    SBMeasureUp: TSpeedButton;
    SBMeasureDown: TSpeedButton;
    SBColUp: TSpeedButton;
    SBColDown: TSpeedButton;
    LFilterError: TLabel;
    Label6: TLabel;
    EBins: TEdit;
    UDBins: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure ListRowsDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListRowsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListRowsClick(Sender: TObject);
    procedure BDeleteRowClick(Sender: TObject);
    procedure CBDistinctClick(Sender: TObject);
    procedure BDeleteMeasureClick(Sender: TObject);
    procedure ListMeasuresClick(Sender: TObject);
    procedure ListColumnsClick(Sender: TObject);
    procedure BDeleteColumnClick(Sender: TObject);
    procedure CBAggregateChange(Sender: TObject);
    procedure CBMissingAsZeroClick(Sender: TObject);
    procedure RGPercentageClick(Sender: TObject);
    procedure RGRunningClick(Sender: TObject);
    procedure CBRunningRowsClick(Sender: TObject);
    procedure EMeasureExpressionChange(Sender: TObject);
    procedure CBRemoveRowsClick(Sender: TObject);
    procedure CBRemoveColsClick(Sender: TObject);
    procedure CBDatePartChange(Sender: TObject);
    procedure ListMeasuresDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListRowsClickCheck(Sender: TObject);
    procedure EMaxChange(Sender: TObject);
    procedure EFilterChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BOKClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CBFilterClick(Sender: TObject);
    procedure CBHistoActiveClick(Sender: TObject);
    procedure SBRowUpClick(Sender: TObject);
    procedure SBRowDownClick(Sender: TObject);
    procedure SBMeasureDownClick(Sender: TObject);
    procedure SBMeasureUpClick(Sender: TObject);
    procedure SBColUpClick(Sender: TObject);
    procedure SBColDownClick(Sender: TObject);
    procedure EBinsChange(Sender: TObject);
  private
    { Private declarations }

    IQuery,
    FQuery : TBIQuery;

    CompTree,
    DataTree : TTreeView;

    IModified : Boolean;

    ICurrentBy : TGroupBy;

    function AddData(const AList:TCheckListBox; const AData:TDataItem; const IsActive:Boolean=True):TQueryItem;
    procedure AddItem(const AList:TCheckListBox; const AItem:TQueryItem);
    function By(const AList:TCheckListBox):TGroupBy;
    procedure ChangeItem(const AList:TCheckListBox);
    function ChangingQuery:Boolean;
    procedure DeleteItem(const AList:TCheckListBox);
    procedure DoExchangeItem(const AList:TCheckListBox; const A,B:Integer); overload;
    procedure DoExchangeItem(const AList:TCheckListBox; const Delta:Integer); overload;

    procedure EnableHistogramControls;
    procedure EnableRowSettings;
    procedure FilterComponent(Sender: TComponent; var Valid:Boolean);
    function ListOf(const ABy:TGroupBy):TCheckListBox;
    function Measure:TMeasure;
    procedure Modified;
    procedure Rebuild;
    procedure RemoveFromList(const AList:TCheckListBox);
    procedure SetByProperties(const ABy:TGroupBy);
    procedure SetMeasureProperties(const AMeasure:TMeasure);
    procedure SetPart(const ACombo:TComboBox; const ABy:TGroupBy);
  public
    { Public declarations }

    Selector : TDataSelector;

    class function Edit(const AOwner:TComponent; const AQuery:TBIQuery):Boolean; static;
    class function Embedd(const AOwner: TComponent; const AParent: TWinControl): TBIQueryEditor; static;

    procedure Refresh(const AQuery:TBIQuery);
  end;

implementation