[WARNING]
WARNING: DO NOT EDIT THIS FILE DIRECTLY!
Use only E-Studio to edit this file.
Editing of this file from any other means is not supported
and may corrupt the experiment design specification.
Technical support will not be able to address any issue in
regards to this file format.

[Experiment]
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
_VersionPersist=6
Root="SessionProc"
Author="zby15522145335@163.com (Beijing Normal University)"
Abstract=""
Notes=""
Creation=1584014685

[Device0]
_VersionPersist=1
OpenDevice=1
Width=1024
Height=768
Bpp=32
Name="Display"
Class="Display"

[Device1]
_VersionPersist=1
OpenDevice=0
Channels=2
Samples=22050
Bps=16
Name="Sound"
Class="Sound"

[Device2]
_VersionPersist=1
OpenDevice=1
CollectionMode=1
EmulateDeviceName=""
CapsLock=0
NumLock=1
Name="Keyboard"
Class="Keyboard"

[Device3]
_VersionPersist=1
OpenDevice=1
CollectionMode=1
EmulateDeviceName=""
OpenMode=0
ShowCursor=0
Name="Mouse"
Class="Mouse"

[DataFile]
WarnBeforeOverwrite=1
WarnIfConvertFailed=1
RemoveERecoveryFile=0
ReceiveFeedbackDuringDataFileConversion=1
LogLevel(2).Name="Block"
LogLevel(3).Name="Trial"
LogLevel(4).Name="SubTrial"
LogLevel(5).Name="LogLevel5"
LogLevel(6).Name="LogLevel6"
LogLevel(7).Name="LogLevel7"
LogLevel(8).Name="LogLevel8"
LogLevel(9).Name="LogLevel9"
LogLevel(10).Name="LogLevel10"

[StartupInfo]
DisplaySummary=1
UseDefaults=0

[StartupInfo1]
Name="Subject"
Prompt="Please enter the Subject Number (1-32767, 0=No Data Logging):"
DataType=0
Enabled=1
PromptEnabled=1
Default="1"
Min=0
Max=32767
PrivateFlags=268435477
PrivateInfo=1

[StartupInfo2]
Name="Session"
Prompt="Please enter the Session Number (1-32767):"
DataType=0
Enabled=1
PromptEnabled=1
Default="1"
Min=1
Max=32767
PrivateFlags=268435477
PrivateInfo=1

[StartupInfo3]
Name="Group"
Prompt="Please enter Subject's Group (0-32767):"
DataType=0
Enabled=0
PromptEnabled=0
Default="1"
Min=0
Max=32767

[StartupInfo4]
Name="Name"
Prompt="Please enter Subject's Name:"
DataType=1
Enabled=0
PromptEnabled=0
Default=""
MaxLength=255

[StartupInfo5]
Name="Age"
Prompt="Please enter Subject's Age (0-150):"
DataType=0
Enabled=0
PromptEnabled=0
Default="0"
Min=0
Max=150

[StartupInfo6]
Name="Sex"
Prompt="Please enter Subject's Sex:"
DataType=2
Enabled=0
PromptEnabled=0
Default="male"
Choice(1).Value="male"
Choice(2).Value="female"

[StartupInfo7]
Name="Handedness"
Prompt="Enter Subject's Handedness:"
DataType=2
Enabled=0
PromptEnabled=0
Default="left"
Choice(1).Value="left"
Choice(2).Value="right"

[StartupInfo8]
Name="ResearcherID"
Prompt="Please enter Researcher's ID:"
DataType=0
Enabled=0
PromptEnabled=0
Default="1"
Min=0
Max=32767

[Object0]
_Version=65536
_ExtentX=2646
_ExtentY=1323
_StockProps=0
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
_ItemList="instruction2;white;wholeexperiment;byebye"
_VersionPersist=1
FlowLines(0).Count=4
FlowLines(0).FlowItem(0).Name="instruction2"
FlowLines(0).FlowItem(1).Name="white"
FlowLines(0).FlowItem(2).Name="wholeexperiment"
FlowLines(0).FlowItem(3).Name="byebye"
LogData=1
Name="SessionProc"
TypeName="Procedure"
Tag=""
Notes=""

[Object1]
_Version=65536
_ExtentX=2646
_ExtentY=1323
_StockProps=0
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
Logging("OnsetDelay").Log=0
Logging("OnsetTime").Log=0
Logging("DurationError").Log=0
Logging("PreRelease").Log=0
Logging("Duration").Log=0
Logging("StartTime").Log=0
Logging("OffsetTime").Log=0
Logging("FinishTime").Log=0
Logging("TimingMode").Log=0
Logging("CustomOnsetTime").Log=0
Logging("CustomOffsetTime").Log=0
Logging("ActionDelay").Log=0
Logging("ActionTime").Log=0
Logging("TargetOffsetTime").Log=0
Logging("TargetOnsetTime").Log=0
Logging("OffsetDelay").Log=0
Logging("RTTime").Log=0
Logging("ACC").Log=0
Logging("RT").Log=0
Logging("RESP").Log=0
Logging("CRESP").Log=0
Logging("Tag").Log=0
Input(0)=!Data0
_VersionPersist=1
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
Duration="-1"
JumpLabel=""
TimingMode=0
PreRelease="0"
OnsetSync=1
OffsetSync=0
Filename="instruction.bmp"
Stretch="No"
MirrorUpDown="No"
MirrorLeftRight="No"
BackColor="white"
BackStyle="opaque"
BorderColor="black"
BorderWidth="0"
X="center"
Y="center"
Width="100%"
Height="100%"
XAlign="center"
YAlign="center"
AlignHorizontal="center"
AlignVertical="center"
ClearAfter="No"
SourceColorKey="black"
UseSourceColorKey="No"
Name="instruction2"
TypeName="ImageDisplay"
Tag=""
Notes=""

[Data0]
DeviceName="Keyboard"
DeviceClass="Keyboard"
AllowableInput="{SPACE}"
CorrectInput=""
TimeLimit=""
MaxCount="1"
InputAction=1
SyncOwnerDuration=1
Enabled=1
FlushInputBuffer="Yes"
TerminationInput=""
UserTag=""
ResponseMode="All"
ProcessBackspace="Yes"

[Object2]
_Version=65536
_ExtentX=2646
_ExtentY=1323
_StockProps=0
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
Logging("trialID").Log=-1
Logging("pic1").Log=-1
Logging("pic2").Log=-1
Logging("pic3").Log=-1
Logging("pos1").Log=-1
Logging("pos2").Log=-1
Logging("pos3").Log=-1
Logging("correctpos").Log=-1
Logging("correctname").Log=-1
Logging("n1").Log=-1
Logging("n2").Log=-1
Logging("n3").Log=-1
Logging("correctresponse").Log=-1
_ItemList="explist"
_VersionPersist=1
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
Order=1
OrderBy=0
ResetEveryRun=0
HideLevelsWithZeroWeight=0
CycleDef=0
CycleValueSamples=0
CycleValueCondition=""
ExitDef=0
ExitValueCycles=1
ExitValueSamples=1
ExitValueSeconds=0
ExitValueCondition=""
LoadMethod=0
Filename=""
UserAttributes=13
Attributes("Weight").DefaultValue="1"
Attributes("Weight").Visible=1
Attributes("Weight").Width=35
Attributes("Weight").OrderIndex=0
Attributes("Nested").DefaultValue=""
Attributes("Nested").Visible=1
Attributes("Nested").Width=28
Attributes("Nested").OrderIndex=1
Attributes("Procedure").DefaultValue="explist"
Attributes("Procedure").Visible=1
Attributes("Procedure").Width=46
Attributes("Procedure").OrderIndex=2
Attributes(1).Name="trialID"
Attributes(1).DefaultValue="?"
Attributes(1).VarType=8
Attributes(1).VarTypeInternal=8
Attributes(1).Visible=1
Attributes(1).Width=75
Attributes(2).Name="pic1"
Attributes(2).DefaultValue="?"
Attributes(2).VarType=8
Attributes(2).VarTypeInternal=8
Attributes(2).Visible=1
Attributes(2).Width=75
Attributes(3).Name="pic2"
Attributes(3).DefaultValue="?"
Attributes(3).VarType=8
Attributes(3).VarTypeInternal=8
Attributes(3).Visible=1
Attributes(3).Width=75
Attributes(4).Name="pic3"
Attributes(4).DefaultValue="?"
Attributes(4).VarType=8
Attributes(4).VarTypeInternal=8
Attributes(4).Visible=1
Attributes(4).Width=77
Attributes(5).Name="pos1"
Attributes(5).DefaultValue="?"
Attributes(5).VarType=8
Attributes(5).VarTypeInternal=8
Attributes(5).Visible=1
Attributes(5).Width=75
Attributes(6).Name="pos2"
Attributes(6).DefaultValue="?"
Attributes(6).VarType=8
Attributes(6).VarTypeInternal=8
Attributes(6).Visible=1
Attributes(6).Width=75
Attributes(7).Name="pos3"
Attributes(7).DefaultValue="?"
Attributes(7).VarType=8
Attributes(7).VarTypeInternal=8
Attributes(7).Visible=1
Attributes(7).Width=75
Attributes(8).Name="correctpos"
Attributes(8).DefaultValue="?"
Attributes(8).VarType=8
Attributes(8).VarTypeInternal=8
Attributes(8).Visible=1
Attributes(8).Width=92
Attributes(9).Name="correctname"
Attributes(9).DefaultValue="?"
Attributes(9).VarType=8
Attributes(9).VarTypeInternal=8
Attributes(9).Visible=1
Attributes(9).Width=75
Attributes(10).Name="n1"
Attributes(10).DefaultValue="?"
Attributes(10).VarType=8
Attributes(10).VarTypeInternal=8
Attributes(10).Visible=1
Attributes(10).Width=75
Attributes(11).Name="n2"
Attributes(11).DefaultValue="?"
Attributes(11).VarType=8
Attributes(11).VarTypeInternal=8
Attributes(11).Visible=1
Attributes(11).Width=75
Attributes(12).Name="n3"
Attributes(12).DefaultValue="?"
Attributes(12).VarType=8
Attributes(12).VarTypeInternal=8
Attributes(12).Visible=1
Attributes(12).Width=75
Attributes(13).Name="correctresponse"
Attributes(13).DefaultValue="?"
Attributes(13).VarType=8
Attributes(13).VarTypeInternal=8
Attributes(13).Visible=1
Attributes(13).Width=75
Levels=54
Levels(1).ValueString="1\t\texplist\t1\t13\t3\t15\t1\t2\t3\t1\tchain\tchain\tbandage\tchoker\tj\t"
Levels(2).ValueString="1\t\texplist\t2\t27\t28\t53\t3\t1\t2\t2\tkerchief\twillow\tkerchief\tlamp\tk\t"
Levels(3).ValueString="1\t\texplist\t3\t45\t6\t46\t2\t3\t1\t3\tspray\tbolster\tstatue\tspray\tl\t"
Levels(4).ValueString="1\t\texplist\t4\t3\t15\t21\t1\t2\t3\t1\tbandage\tbandage\tchoker\tglove\tj\t"
Levels(5).ValueString="1\t\texplist\t5\t8\t32\t14\t1\t2\t3\t1\tbouquet\tbouquet\tperfume\tchandelier\tj\t"
Levels(6).ValueString="1\t\texplist\t6\t53\t46\t24\t1\t2\t3\t1\twillow\twillow\tstatue\thanky\tj\t"
Levels(7).ValueString="1\t\texplist\t7\t30\t2\t20\t2\t3\t1\t3\tnecklace\tashtray\tflask\tnecklace\tl\t"
Levels(8).ValueString="1\t\texplist\t8\t42\t7\t27\t3\t1\t2\t2\tscissors\tkerchief\tscissors\tbooze\tk\t"
Levels(9).ValueString="1\t\texplist\t9\t50\t20\t2\t1\t2\t3\t1\tvase\tvase\tflask\tashtray\tj\t"
Levels(10).ValueString="1\t\texplist\t10\t38\t8\t50\t1\t2\t3\t1\tradio\tradio\tbouquet\tvase\tj\t"
Levels(11).ValueString="1\t\texplist\t11\t4\t47\t31\t3\t1\t2\t2\tbasket\tnecktie\tbasket\tsuitcase\tk\t"
Levels(12).ValueString="1\t\texplist\t12\t48\t50\t13\t3\t1\t2\t2\ttablet\tchain\ttablet\tvase\tk\t"
Levels(13).ValueString="1\t\texplist\t13\t37\t16\t35\t3\t1\t2\t2\tquilt\tpitcher\tquilt\tcradle\tk\t"
Levels(14).ValueString="1\t\texplist\t14\t22\t34\t47\t2\t3\t1\t3\tgoblet\tpipe\tsuitcase\tgoblet\tl\t"
Levels(15).ValueString="1\t\texplist\t15\t16\t40\t38\t3\t1\t2\t2\tcradle\tradio\tcradle\trug\tk\t"
Levels(16).ValueString="1\t\texplist\t16\t36\t13\t4\t3\t1\t2\t2\tpolish\tbasket\tpolish\tchain\tk\t"
Levels(17).ValueString="1\t\texplist\t17\t33\t17\t18\t3\t1\t2\t2\tpillow\tcushion\tpillow\tcurtain\tk\t"
Levels(18).ValueString="1\t\texplist\t18\t34\t42\t40\t1\t2\t3\t1\tpipe\tpipe\tscissors\trug\tj\t"
Levels(19).ValueString="1\t\texplist\t19\t25\t1\t8\t2\t3\t1\t3\thelmet\tapron\tbouquet\thelmet\tl\t"
Levels(20).ValueString="1\t\texplist\t20\t1\t54\t9\t1\t2\t3\t1\tapron\tapron\tworm\tbunk\tj\t"
Levels(21).ValueString="1\t\texplist\t21\t31\t9\t16\t2\t3\t1\t3\tnecktie\tbunk\tcradle\tnecktie\tl\t"
Levels(22).ValueString="1\t\texplist\t22\t32\t45\t43\t1\t2\t3\t1\tperfume\tperfume\tspray\tscroll\tj\t"
Levels(23).ValueString="1\t\texplist\t23\t26\t43\t42\t3\t1\t2\t2\thook\tscissors\thook\tscroll\tk\t"
Levels(24).ValueString="1\t\texplist\t24\t46\t26\t3\t3\t1\t2\t2\tstatue\tbandage\tstatue\thook\tk\t"
Levels(25).ValueString="1\t\texplist\t25\t9\t51\t45\t2\t3\t1\t3\tbunk\twardrobe\tspray\tbunk\tl\t"
Levels(26).ValueString="1\t\texplist\t26\t21\t39\t7\t2\t3\t1\t3\tglove\trazor\tbooze\tglove\tl\t"
Levels(27).ValueString="1\t\texplist\t27\t54\t27\t5\t1\t2\t3\t1\tworm\tworm\tkerchief\tblanket\tj\t"
Levels(28).ValueString="1\t\texplist\t28\t41\t24\t26\t2\t3\t1\t3\tsaber\thanky\thook\tsaber\tl\t"
Levels(29).ValueString="1\t\texplist\t29\t44\t10\t37\t3\t1\t2\t2\tslipper\tquilt\tslipper\tcameo\tk\t"
Levels(30).ValueString="1\t\texplist\t30\t52\t22\t36\t3\t1\t2\t2\twheat\tpolish\twheat\tgoblet\tk\t"
Levels(31).ValueString="1\t\texplist\t31\t18\t35\t33\t1\t2\t3\t1\tcushion\tcushion\tpitcher\tpillow\tj\t"
Levels(32).ValueString="1\t\texplist\t32\t17\t21\t48\t1\t2\t3\t1\tcurtain\tcurtain\tglove\ttablet\tj\t"
Levels(33).ValueString="1\t\texplist\t33\t29\t33\t32\t3\t1\t2\t2\tmattress\tperfume\tmattress\tpillow\tk\t"
Levels(34).ValueString="1\t\texplist\t34\t49\t30\t10\t2\t3\t1\t3\ttelephone\tnecklace\tcameo\ttelephone\tl\t"
Levels(35).ValueString="1\t\texplist\t35\t47\t48\t23\t2\t3\t1\t3\tsuitcase\ttablet\thanger\tsuitcase\tl\t"
Levels(36).ValueString="1\t\texplist\t36\t19\t14\t34\t1\t2\t3\t1\tfan\tfan\tchandelier\tpipe\tj\t"
Levels(37).ValueString="1\t\texplist\t37\t7\t12\t39\t2\t3\t1\t3\tbooze\tcarafe\trazor\tbooze\tl\t"
Levels(38).ValueString="1\t\texplist\t38\t51\t49\t17\t1\t2\t3\t1\twardrobe\twardrobe\ttelephone\tcurtain\tj\t"
Levels(39).ValueString="1\t\texplist\t39\t10\t52\t28\t1\t2\t3\t1\tcameo\tcameo\twheat\tlamp\tj\t"
Levels(40).ValueString="1\t\texplist\t40\t20\t4\t12\t3\t1\t2\t2\tflask\tcarafe\tflask\tbasket\tk\t"
Levels(41).ValueString="1\t\texplist\t41\t43\t53\t29\t2\t3\t1\t3\tscroll\twillow\tmattress\tscroll\tl\t"
Levels(42).ValueString="1\t\texplist\t42\t6\t41\t19\t1\t2\t3\t1\tbolster\tbolster\tsaber\tfan\tj\t"
Levels(43).ValueString="1\t\texplist\t43\t39\t37\t49\t2\t3\t1\t3\trazor\tquilt\ttelephone\trazor\tl\t"
Levels(44).ValueString="1\t\texplist\t44\t35\t29\t11\t2\t3\t1\t3\tpitcher\tmattress\tcane\tpitcher\tl\t"
Levels(45).ValueString="1\t\texplist\t45\t12\t5\t44\t3\t1\t2\t2\tcarafe\tslipper\tcarafe\tblanket\tk\t"
Levels(46).ValueString="1\t\texplist\t46\t28\t31\t25\t3\t1\t2\t2\tlamp\thelmet\tlamp\tnecktie\tk\t"
Levels(47).ValueString="1\t\texplist\t47\t24\t11\t30\t2\t3\t1\t3\thanky\tcane\tnecklace\thanky\tl\t"
Levels(48).ValueString="1\t\texplist\t48\t40\t38\t51\t1\t2\t3\t1\trug\trug\tradio\twardrobe\tj\t"
Levels(49).ValueString="1\t\texplist\t49\t23\t18\t52\t2\t3\t1\t3\thanger\tcushion\twheat\thanger\tl\t"
Levels(50).ValueString="1\t\texplist\t50\t2\t44\t1\t3\t1\t2\t2\tashtray\tapron\tashtray\tslipper\tk\t"
Levels(51).ValueString="1\t\texplist\t51\t15\t25\t22\t3\t1\t2\t2\tchoker\tgoblet\tchoker\thelmet\tk\t"
Levels(52).ValueString="1\t\texplist\t52\t11\t36\t41\t2\t3\t1\t3\tcane\tpolish\tsaber\tcane\tl\t"
Levels(53).ValueString="1\t\texplist\t53\t5\t19\t54\t1\t2\t3\t1\tblanket\tblanket\tfan\tworm\tj\t"
Levels(54).ValueString="1\t\texplist\t54\t14\t23\t6\t2\t3\t1\t3\tchandelier\thanger\tbolster\tchandelier\tl\t"
Name="wholeexperiment"
TypeName="List"
Tag=""
Notes=""

[Object3]
_Version=65536
_ExtentX=2646
_ExtentY=1323
_StockProps=0
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
Logging("OnsetDelay").Log=0
Logging("OnsetTime").Log=0
Logging("DurationError").Log=0
Logging("PreRelease").Log=0
Logging("Duration").Log=0
Logging("StartTime").Log=0
Logging("OffsetTime").Log=0
Logging("FinishTime").Log=0
Logging("TimingMode").Log=0
Logging("CustomOnsetTime").Log=0
Logging("CustomOffsetTime").Log=0
Logging("ActionDelay").Log=0
Logging("ActionTime").Log=0
Logging("TargetOffsetTime").Log=0
Logging("TargetOnsetTime").Log=0
Logging("OffsetDelay").Log=0
Logging("RTTime").Log=0
Logging("ACC").Log=0
Logging("RT").Log=0
Logging("RESP").Log=0
Logging("CRESP").Log=0
Logging("Tag").Log=0
Input(0)=!Data1
_VersionPersist=1
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
Duration="-1"
JumpLabel=""
TimingMode=0
PreRelease="0"
OnsetSync=1
OffsetSync=0
Filename="byebye.bmp"
Stretch="No"
MirrorUpDown="No"
MirrorLeftRight="No"
BackColor="white"
BackStyle="opaque"
BorderColor="black"
BorderWidth="0"
X="center"
Y="center"
Width="100%"
Height="100%"
XAlign="center"
YAlign="center"
AlignHorizontal="center"
AlignVertical="center"
ClearAfter="No"
SourceColorKey="black"
UseSourceColorKey="No"
Name="byebye"
TypeName="ImageDisplay"
Tag=""
Notes=""

[Data1]
DeviceName="Keyboard"
DeviceClass="Keyboard"
AllowableInput="{SPACE}"
CorrectInput=""
TimeLimit=""
MaxCount="1"
InputAction=1
SyncOwnerDuration=1
Enabled=1
FlushInputBuffer="Yes"
TerminationInput=""
UserTag=""
ResponseMode="All"
ProcessBackspace="Yes"

[Object4]
_Version=65536
_ExtentX=2646
_ExtentY=1323
_StockProps=0
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
_ItemList="white1;stimuli;recording"
_VersionPersist=1
FlowLines(0).Count=3
FlowLines(0).FlowItem(0).Name="white1"
FlowLines(0).FlowItem(1).Name="stimuli"
FlowLines(0).FlowItem(2).Name="recording"
LogData=1
Name="explist"
TypeName="Procedure"
Tag=""
Notes=""

[Object5]
_Version=131072
_ExtentX=2646
_ExtentY=1323
_StockProps=0
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
_VersionPersist=1
Code="\nOpen \"result.txt\" For Append As #1\nPrint #1, c.GetAttrib(\"correctpos\"), c.GetAttrib(\"n1\"), c.GetAttrib(\"n2\"), c.GetAttrib(\"n3\"), stimuli.RT, stimuli.ACC\nClose #1\n"
Name="recording"
TypeName="InLine"
Tag=""
Notes=""

[Object6]
_Version=65536
_ExtentX=2646
_ExtentY=1323
_StockProps=0
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
Logging("OnsetDelay").Log=0
Logging("OnsetTime").Log=0
Logging("DurationError").Log=0
Logging("PreRelease").Log=0
Logging("Duration").Log=0
Logging("StartTime").Log=0
Logging("OffsetTime").Log=0
Logging("FinishTime").Log=0
Logging("TimingMode").Log=0
Logging("CustomOnsetTime").Log=0
Logging("CustomOffsetTime").Log=0
Logging("ActionDelay").Log=0
Logging("ActionTime").Log=0
Logging("TargetOffsetTime").Log=0
Logging("TargetOnsetTime").Log=0
Logging("OffsetDelay").Log=0
Logging("RTTime").Log=0
Logging("ACC").Log=0
Logging("RT").Log=0
Logging("RESP").Log=0
Logging("CRESP").Log=0
Logging("Tag").Log=0
_VersionPersist=1
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
Text=""
ForeColor="black"
BackColor="white"
BackStyle="opaque"
BorderColor="black"
BorderWidth="0"
X="center"
Y="center"
Width="100%"
Height="100%"
XAlign="center"
YAlign="center"
AlignHorizontal="center"
AlignVertical="center"
FontName="Courier New"
FontSize="18"
FontBold="Yes"
FontItalic="No"
FontUnderline="No"
FontStrikeout="No"
WordWrap=1
ClearAfter="No"
Duration="1000"
JumpLabel=""
TimingMode=0
PreRelease="0"
OnsetSync=1
OffsetSync=0
Name="white"
TypeName="TextDisplay"
Tag=""
Notes=""

[Object7]
_Version=65536
_ExtentX=2646
_ExtentY=1323
_StockProps=0
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
Logging("OnsetDelay").Log=0
Logging("OnsetTime").Log=0
Logging("DurationError").Log=0
Logging("PreRelease").Log=0
Logging("Duration").Log=0
Logging("StartTime").Log=0
Logging("OffsetTime").Log=0
Logging("FinishTime").Log=0
Logging("TimingMode").Log=0
Logging("CustomOnsetTime").Log=0
Logging("CustomOffsetTime").Log=0
Logging("ActionDelay").Log=0
Logging("ActionTime").Log=0
Logging("TargetOffsetTime").Log=0
Logging("TargetOnsetTime").Log=0
Logging("OffsetDelay").Log=0
Logging("RTTime").Log=0
Logging("ACC").Log=0
Logging("RT").Log=0
Logging("RESP").Log=0
Logging("CRESP").Log=0
Logging("Tag").Log=0
Input(0)=!Data2
_VersionPersist=2
ActiveState="Default"
States.Count=1
States(1).Name="Default"
States("Default").X="center"
States("Default").Y="center"
States("Default").Width="100%"
States("Default").Height="100%"
States("Default").XAlign="center"
States("Default").YAlign="center"
States("Default").BackColor="white"
States("Default").BackStyle="opaque"
States("Default").BorderColor="black"
States("Default").BorderWidth="0"
States("Default").ClearAfter="No"
States("Default").Enabled="Yes"
States("Default").ChildCount=4
States("Default").Objects(1).Type="Image"
States("Default").Objects(1).Filename="[n1].bmp"
States("Default").Objects(1).Stretch="Yes"
States("Default").Objects(1).MirrorLeftRight="No"
States("Default").Objects(1).MirrorUpDown="No"
States("Default").Objects(1).Width="200"
States("Default").Objects(1).Height="200"
States("Default").Objects(1).X="162"
States("Default").Objects(1).Y="center"
States("Default").Objects(1).AlignHorizontal="center"
States("Default").Objects(1).AlignVertical="center"
States("Default").Objects(1).ForeColor="black"
States("Default").Objects(1).BackColor="white"
States("Default").Objects(1).BackStyle="opaque"
States("Default").Objects(1).BorderWidth="0"
States("Default").Objects(1).BorderColor="black"
States("Default").Objects(1).XAlign="center"
States("Default").Objects(1).YAlign="top"
States("Default").Objects(1).SourceColorKey="black"
States("Default").Objects(1).UseSourceColorKey="No"
States("Default").Objects(1).Name="Image1"
States("Default").Objects(2).Type="Image"
States("Default").Objects(2).Filename="[n2].bmp"
States("Default").Objects(2).Stretch="Yes"
States("Default").Objects(2).MirrorLeftRight="No"
States("Default").Objects(2).MirrorUpDown="No"
States("Default").Objects(2).Width="200"
States("Default").Objects(2).Height="200"
States("Default").Objects(2).X="center"
States("Default").Objects(2).Y="center"
States("Default").Objects(2).AlignHorizontal="center"
States("Default").Objects(2).AlignVertical="center"
States("Default").Objects(2).ForeColor="black"
States("Default").Objects(2).BackColor="white"
States("Default").Objects(2).BackStyle="opaque"
States("Default").Objects(2).BorderWidth="0"
States("Default").Objects(2).BorderColor="black"
States("Default").Objects(2).XAlign="center"
States("Default").Objects(2).YAlign="top"
States("Default").Objects(2).SourceColorKey="black"
States("Default").Objects(2).UseSourceColorKey="No"
States("Default").Objects(2).Name="Image2"
States("Default").Objects(3).Type="Image"
States("Default").Objects(3).Filename="[n3].bmp"
States("Default").Objects(3).Stretch="Yes"
States("Default").Objects(3).MirrorLeftRight="No"
States("Default").Objects(3).MirrorUpDown="No"
States("Default").Objects(3).Width="200"
States("Default").Objects(3).Height="200"
States("Default").Objects(3).X="962"
States("Default").Objects(3).Y="center"
States("Default").Objects(3).AlignHorizontal="center"
States("Default").Objects(3).AlignVertical="center"
States("Default").Objects(3).ForeColor="black"
States("Default").Objects(3).BackColor="white"
States("Default").Objects(3).BackStyle="opaque"
States("Default").Objects(3).BorderWidth="0"
States("Default").Objects(3).BorderColor="black"
States("Default").Objects(3).XAlign="right"
States("Default").Objects(3).YAlign="top"
States("Default").Objects(3).SourceColorKey="black"
States("Default").Objects(3).UseSourceColorKey="No"
States("Default").Objects(3).Name="Image3"
States("Default").Objects(4).Type="Text"
States("Default").Objects(4).Text="[correctname]"
States("Default").Objects(4).Width="200"
States("Default").Objects(4).Height="100"
States("Default").Objects(4).X="center"
States("Default").Objects(4).Y="184"
States("Default").Objects(4).AlignHorizontal="center"
States("Default").Objects(4).AlignVertical="center"
States("Default").Objects(4).FontName="Consolas"
States("Default").Objects(4).FontSize="20"
States("Default").Objects(4).FontBold="Yes"
States("Default").Objects(4).FontUnderline="No"
States("Default").Objects(4).FontStrikeout="No"
States("Default").Objects(4).FontItalic="No"
States("Default").Objects(4).ForeColor="black"
States("Default").Objects(4).BackColor="white"
States("Default").Objects(4).BackStyle="opaque"
States("Default").Objects(4).BorderWidth="0"
States("Default").Objects(4).BorderColor="black"
States("Default").Objects(4).XAlign="center"
States("Default").Objects(4).YAlign="top"
States("Default").Objects(4).WordWrap=1
States("Default").Objects(4).Name="Text1"
Duration="-1"
JumpLabel=""
TimingMode=0
PreRelease="0"
OnsetSync=1
OffsetSync=0
Name="stimuli"
TypeName="Slide"
Tag=""
Notes=""

[Data2]
DeviceName="Keyboard"
DeviceClass="Keyboard"
AllowableInput="jkl"
CorrectInput="[correctresponse]"
TimeLimit=""
MaxCount="1"
InputAction=1
SyncOwnerDuration=1
Enabled=1
FlushInputBuffer="Yes"
TerminationInput=""
UserTag=""
ResponseMode="All"
ProcessBackspace="Yes"

[Object8]
_Version=65536
_ExtentX=2646
_ExtentY=1323
_StockProps=0
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
Logging("OnsetDelay").Log=0
Logging("OnsetTime").Log=0
Logging("DurationError").Log=0
Logging("PreRelease").Log=0
Logging("Duration").Log=0
Logging("StartTime").Log=0
Logging("OffsetTime").Log=0
Logging("FinishTime").Log=0
Logging("TimingMode").Log=0
Logging("CustomOnsetTime").Log=0
Logging("CustomOffsetTime").Log=0
Logging("ActionDelay").Log=0
Logging("ActionTime").Log=0
Logging("TargetOffsetTime").Log=0
Logging("TargetOnsetTime").Log=0
Logging("OffsetDelay").Log=0
Logging("RTTime").Log=0
Logging("ACC").Log=0
Logging("RT").Log=0
Logging("RESP").Log=0
Logging("CRESP").Log=0
Logging("Tag").Log=0
_VersionPersist=1
VersionMajor=1
VersionMinor=1
VersionInternal=4
VersionBuild=1
Text=""
ForeColor="black"
BackColor="white"
BackStyle="opaque"
BorderColor="black"
BorderWidth="0"
X="center"
Y="center"
Width="100%"
Height="100%"
XAlign="center"
YAlign="center"
AlignHorizontal="center"
AlignVertical="center"
FontName="Courier New"
FontSize="18"
FontBold="Yes"
FontItalic="No"
FontUnderline="No"
FontStrikeout="No"
WordWrap=1
ClearAfter="No"
Duration="1000"
JumpLabel=""
TimingMode=0
PreRelease="0"
OnsetSync=1
OffsetSync=0
Name="white1"
TypeName="TextDisplay"
Tag=""
Notes=""

[UserScript]


