(* ::Package:: *)

BeginPackage["Klotski`"]

pack::usage =
		"\:6253\:5305\:51fd\:6570\:ff0c\:5c06\:77e9\:9635\:5f62\:5f0f\:7684\:5c40\:9762\:8f6c\:6210\:4ee5\:7a7a\:683c\:4e3a\:5206\:9694\:7b26\:7684\:5355\:884c\:5b57\:7b26\:4e32"

unPack::usage =
		"\:89e3\:5305\:51fd\:6570\:ff0c\:5c06\:4ee5\:7a7a\:683c\:4e3a\:5206\:9694\:7b26\:7684\:5355\:884c\:5b57\:7b26\:4e32\:5c40\:9762\:8f6c\:4e3a\:77e9\:9635\:5f62\:5f0f"

letterToTypeN::usage =
		"\:6839\:636e\:6570\:636e\:4e3a\:6bcf\:4e2a\:68cb\:5b50\:5206\:7c7b\:ff0c\:8fd4\:56de\:89c4\:5219\:5217\:8868"

packType::usage =
		"\:6309\:7c7b\:578b\:6253\:5305\:51fd\:6570\:ff0c\:5c06\:77e9\:9635\:5f62\:5f0f\:7684\:5c40\:9762\:8f6c\:6210\:4ee5\:7a7a\:683c\:4e3a\:5206\:9694\:7b26\:7684\:5355\:884c\:5b57\:7b26\:4e32"

vacancyAroundAMove::usage =
		"\:67e5\:627e\:7a7a\:4f4d\:56db\:5468\:7684\:53ef\:80fd\:53ef\:79fb\:52a8\:68cb\:5b50\:53ca\:5176\:65b9\:5411\:ff1a{{\:68cb\:5b501,{\:5782\:76f4\:65b9\:54111,\:6c34\:5e73\:65b9\:54111},{\:5782\:76f4\:65b9\:54111,\:6c34\:5e73\:65b9\:54111}},{\:68cb\:5b502,{\:5782\:76f4\:65b9\:54111,\:6c34\:5e73\:65b9\:54111}}}"

moveToVacancy::usage =
		"\:6309 vacancyAroundAMove \:5f97\:5230\:7684\:7ed3\:679c\:8fdb\:884c\:6d4b\:8bd5\:ff0c\:5e76\:8fd4\:56de\:5408\:6cd5\:7684\:64cd\:4f5c\:7ed3\:679c"

sortSolve::usage =
		"\:8f93\:5165\:ff1a\:961f\:5217,\:64cd\:4f5c\:8bb0\:5f55,\:89e3\:7684\:7ed3\:679c\:4f4d\:7f6e\:ff1b\:6574\:7406\:6c42\:89e3\:8fc7\:7a0b\:4e2d\:5f97\:5230\:7684\:961f\:5217\:548c\:64cd\:4f5c\:8bb0\:5f55\:ff0c\:5f97\:5230\:6bcf\:6b65\:72b6\:6001\:5f62\:5f0f\:7684\:89e3\:3002
		\:4f8b\:5982\:ff1asolveStatus=sortSolve[queue,operationRecord,successK];"

toBriefCode::usage =
		"\:8f6c\:4e3a\:7b80\:8bb0\:7801\:ff1a\:5c06\:72b6\:6001\:5f62\:5f0f\:7684\:89e3\:ff0c\:8f6c\:6210\:53d8\:6362\:6b65\:9aa4\:5f62\:5f0f\:7684\:7b80\:8bb0\:7801\:ff08\:542b\:521d\:59cb\:72b6\:6001\:ff09
		\" \"\:ff1a\:64cd\:4f5c\:4e0e\:64cd\:4f5c\:4e4b\:95f4\:7684\:5206\:9694\:7b26;  \">\"\:ff1a\:5b57\:6bcd\:4e0e\:65b9\:5411\:4e4b\:95f4\:7684\:5206\:9694\:7b26;
		\:4f8b\:5982\:ff1abriefCode=StringRiffle[toBriefCode/@solvePack,\"\n\"]"
toFlow::usage =
		"\:8f6c\:4e3a\:53d8\:6362\:8fc7\:7a0b\:6d41\:ff1a\:5c06\:72b6\:6001\:5f62\:5f0f\:7684\:89e3\:ff0c\:8f6c\:6210\:53d8\:6362\:6b65\:9aa4\:5f62\:5f0f"

fromBriefCode::usage =
		"\:8bfb\:53d6\:7b80\:8bb0\:7801\:ff1a\:5c06\:7b80\:8bb0\:7801\:8f6c\:6210\:72b6\:6001\:5f62\:5f0f\:7684\:89e3\:3002
		\:4f8b\:5982\:ff1asolveStatus=sortSolve[queue,operationRecord,successK];"

chessmanToPosFromPos::usage =
		"\:8f93\:5165\:ff1a\:6bcf\:6b65\:72b6\:6001\:5f62\:5f0f\:7684\:4e00\:4e2a\:89e3\:ff0c\:8fd4\:56de{\:68cb\:5b50\:503c\:ff0c{\:53ca\:5176\:76ee\:6807\:7a7a\:4f4d\:7684\:5750\:6807}\:ff0c{\:53ca\:5176\:817e\:51fa\:7a7a\:4f4d\:7684\:5750\:6807}}"

(*\:65b9\:5411\:540d \[RightArrow] \:5411\:91cf*)
fromUDLR={"R"->{0,1},"L"->{0,-1},"D"->{1,0},"U"->{-1,0}};
(*\:5411\:91cf \[RightArrow] \:65b9\:5411\:540d*)
toUDLR=#[[2]]->#[[1]]&/@fromUDLR;

Begin["`Private`"]

(*===================*)
(*\:6253\:5305\:4e0e\:89e3\:5305\:51fd\:6570*)
(*===================*)
(*\:6253\:5305*)
pack[dataMatrix_]:=StringRiffle[Flatten[dataMatrix]," "];

(*\:89e3\:5305*)
unPack[packData_,columns_]:=Partition[StringSplit[packData," "],columns];

(*\:6309\:7c7b\:578b\:6253\:5305\:ff0c\:7528\:4e8e\:5224\:65ad\:662f\:5426\:91cd\:590d*)
(*packType[dataMatrix_,packTypeRule_]:=StringRiffle[Flatten[dataMatrix]/.packTypeRule," "];*)
packType[dataMatrix_,packTypeRule_]:=StringJoin[dataMatrix/.packTypeRule];
(*\:6839\:636e\:6570\:636e\:4e3a\:6bcf\:4e2a\:68cb\:5b50\:5206\:7c7b\:ff0c\:8fd4\:56de\:89c4\:5219\:5217\:8868*)
letterToTypeN[dataMatrix_]:=Module[{letter=DeleteCases[Union[Flatten[dataMatrix]],"#"],letterPos,movePos,k,unionMovePos},
letterPos=Position[dataMatrix,#]&/@letter;
movePos=Table[#-letterPos[[k,1]]&/@letterPos[[k]],{k,Length[letterPos]}];
unionMovePos=Union[movePos];
Thread[letter->movePos/.Thread[unionMovePos->CharacterRange["!","~"][[;;Length[unionMovePos]]]]]~Join~{"#"->" "}];

(*===================*)
(*\:4e0b\:9762\:662f\:4e24\:4e2a\:51fd\:6570\:662f\:6c42\:89e3\:7684\:6838\:5fc3\:51fd\:6570*)
(*\:9002\:7528\:4e8e\:975e\:6b63\:89c4\:7684\:534e\:5bb9\:9053\:ff0c\:6bd4\:5982\:68cb\:5b50\:53d8\:5f62\:ff0c\:589e\:51cf\:7a7a\:4f4d\:ff0c\:6269\:5927\:6216\:7f29\:5c0f\:68cb\:76d8\:ff08\:4f46\:53ea\:80fd\:662f\:77e9\:5f62\:68cb\:76d8\:ff09*)
(*===================*)
(*\:8fd4\:56de\:8f93\:5165\:5c40\:9762\:4e2d\:53ef\:80fd\:80fd\:79fb\:52a8\:7684\:68cb\:5b50\:53ca\:53ef\:79fb\:52a8\:7684\:65b9\:5411\:ff1a{{\:68cb\:5b501,{\:5782\:76f4\:65b9\:54111,\:6c34\:5e73\:65b9\:54111},{\:5782\:76f4\:65b9\:54111,\:6c34\:5e73\:65b9\:54111}},{\:68cb\:5b502,{\:5782\:76f4\:65b9\:54111,\:6c34\:5e73\:65b9\:54111}}}*)
vacancyAroundAMove[dataMatrix_,rows_,columns_]:=Module[{zeroPos=Position[dataMatrix,"#"](*\:7a7a\:4f4d\:7684\:4f4d\:7f6e*),aroundPosADir,chessman},
aroundPosADir=Cases[Flatten[Outer[{#1+#2,-#2}&,zeroPos,toUDLR[[;;,1]],1],1],{{x_,y_},_}/;x>0&&x<=rows&&y>0&&y<=columns];(*\:5c06\:7a7a\:4f4d\:5411\:56db\:5468\:79fb\:52a8\:ff0c\:4fdd\:7559\:53ef\:80fd\:7684\:76ee\:6807\:4f4d\:7f6e\:ff08\:68cb\:5b50\:ff09\:53ca\:76f8\:53cd\:79fb\:52a8\:65b9\:5411\:ff08\:68cb\:5b50\:7684\:79fb\:52a8\:65b9\:5411\:ff09*)
chessman=DeleteCases[{Extract[dataMatrix,#[[1]]],#[[2]]}&/@aroundPosADir,({"#",_}|{"@",_})](*\:6839\:636e\:68cb\:5b50\:4f4d\:7f6e\:63d0\:53d6\:68cb\:5b50\:503c\:ff0c\:4fdd\:7559\:79fb\:52a8\:65b9\:5411\:ff0c\:6700\:540e\:8fc7\:6ee4\:6389\:7a7a\:4f4d\:548c\:56fa\:5b9a\:68cb\:5b50*)];

(*\:6309 vacancyAroundAMove \:5f97\:5230\:7684\:7ed3\:679c\:8fdb\:884c\:6d4b\:8bd5\:ff0c\:5e76\:8fd4\:56de\:5408\:6cd5\:7684\:64cd\:4f5c\:7ed3\:679c*)
moveToVacancy[moveData_,currentMatrix_,vacancyN_,fixedN_]:=Module[{cData,k,kk,n=Length[moveData],lsPos,rs},
rs=Reap[Do[cData=currentMatrix;
lsPos=Position[currentMatrix,moveData[[k,1]]];(*\:7b2ck\:4e2a\:53ef\:80fd\:80fd\:79fb\:52a8\:68cb\:5b50\:7684\:5168\:90e8\:4f4d\:7f6e*)
(cData[[Sequence@@#]]="#")&/@lsPos;(*\:7528\:7a7a\:4f4d#\:8986\:76d6\:8be5\:68cb\:5b50*)
lsPos=#+moveData[[k,kk]]&/@lsPos;(*\:79fb\:52a8\:540e\:68cb\:5b50\:7684\:4f4d\:7f6e*)
(cData[[Sequence@@#]]=moveData[[k,1]])&/@lsPos;(*\:7528\:68cb\:5b50\:503c\:8986\:76d6\:79fb\:52a8\:540e\:7684\:4f4d\:7f6e*)
If[Count[cData,"#",{2}]==vacancyN&&Count[cData,"@",{2}]==fixedN,Sow[cData]];(*\:5982\:679c\:5728\:5b8c\:6210\:4e0a\:9762\:7684\:64cd\:4f5c\:540e\:7684\:5c40\:9762\:4e2d\:6021\:6709\:4e24\:4e2a\:7a7a\:4f4d\:ff0c\:5219\:8ba4\:4e3a\:8be5\:64cd\:4f5c\:662f\:5408\:6cd5\:7684*)
,{k,n},{kk,2,Length[moveData[[k]]]}]];
Return[Union[Flatten[rs[[2]],1]]]];

(*===================*)
(*\:7ed3\:679c\:5904\:7406\:51fd\:6570*)
(*===================*)
(*\:6574\:7406\:6c42\:89e3\:8fc7\:7a0b\:4e2d\:5f97\:5230\:7684\:961f\:5217\:548c\:64cd\:4f5c\:8bb0\:5f55\:ff0c\:5f97\:5230\:6bcf\:6b65\:72b6\:6001\:5f62\:5f0f\:7684\:89e3*)
sortSolve[queue_,operationRecord_,successK_]:=Module[{reverseOperationRecord=Association[Flatten[Thread[#[[2]]->#[[1]]]&/@Normal[operationRecord]]](*\:5c06\:64cd\:4f5c\:8bb0\:5f55\:4e2d\:7684\:6bcf\:9879\:5012\:7f6e*),
solve},
solve=Reverse[NestWhileList[reverseOperationRecord,#,#!=1&]]&/@successK;(*\:89e3\:ff1a\:5f00\:59cb \[RightArrow] \:7ed3\:675f\:7684\:5e8f\:53f7*)
Map[queue,solve,{2}]];

(*\:8f6c\:4e3a\:89e3\:7b80\:8bb0\:7801\:ff1a\:5c06\:72b6\:6001\:5f62\:5f0f\:7684\:89e3\:ff0c\:8f6c\:6210\:53d8\:6362\:6b65\:9aa4\:5f62\:5f0f\:7684\:7b80\:8bb0\:7801\:ff08\:542b\:521d\:59cb\:72b6\:6001\:ff09*)
(*" "\:ff1a\:64cd\:4f5c\:4e0e\:64cd\:4f5c\:4e4b\:95f4\:7684\:5206\:9694\:7b26;  ">"\:ff1a\:5b57\:6bcd\:4e0e\:65b9\:5411\:4e4b\:95f4\:7684\:5206\:9694\:7b26;*)
toBriefCode[solvePack1_,columns_]:=Module[{nn=Length[solvePack1]-1,trueFalse,chessman,chessmanPosCD,chessmanDirection},
solvePack1[[1]]<>":"<>StringRiffle[Table[
trueFalse=MapThread[Unequal,StringSplit[#," "]&/@solvePack1[[k;;k+1]]];(*\:6807\:8bb0\:5728\:7b2ck\:6b65\:5c06\:88ab\:79fb\:52a8\:7684\:68cb\:5b50\:ff0c\:542b\:7a7a\:4f4d*)
chessman=FirstCase[Pick[StringSplit[solvePack1[[k]]," "],trueFalse],Except["#"]];(*\:7b2ck\:6b65\:5c06\:88ab\:79fb\:52a8\:7684\:68cb\:5b50*)
chessmanPosCD=FirstPosition[Partition[StringSplit[#," "],columns],chessman]&/@solvePack1[[k;;k+1]];(*\:7b2ck\:6b65\:5c06\:88ab\:79fb\:52a8\:7684\:68cb\:5b50\:7684\:5f53\:524d\:4f4d\:7f6e\:4e0e\:76ee\:6807\:4f4d\:7f6e*)
chessmanDirection=Sign[Differences[chessmanPosCD]]/.toUDLR;(*\:88ab\:79fb\:52a8\:7684\:68cb\:5b50\:7684\:79fb\:52a8\:65b9\:5411\:ff0c\:4e0a\:4e0b\:5de6\:53f3\:ff1aUDLR *)
chessman<>">"<>chessmanDirection,{k,nn}]," "]];

(*\:8f6c\:4e3a\:53d8\:6362\:8fc7\:7a0b\:6d41\:ff1a\:5c06\:72b6\:6001\:5f62\:5f0f\:7684\:89e3\:ff0c\:8f6c\:6210\:53d8\:6362\:6b65\:9aa4\:5f62\:5f0f*)
toFlow[solvePack1_,columns_]:=Module[{nn=Length[solvePack1]-1,trueFalse,chessman,chessmanPosCD,chessmanDirection},
StringRiffle[Table[
trueFalse=MapThread[Unequal,StringSplit[#," "]&/@solvePack1[[k;;k+1]]];(*\:6807\:8bb0\:5728\:7b2ck\:6b65\:5c06\:88ab\:79fb\:52a8\:7684\:68cb\:5b50\:ff0c\:542b\:7a7a\:4f4d*)
chessman=FirstCase[Pick[StringSplit[solvePack1[[k]]," "],trueFalse],Except["#"]];(*\:7b2ck\:6b65\:5c06\:88ab\:79fb\:52a8\:7684\:68cb\:5b50*)
chessmanPosCD=FirstPosition[Partition[StringSplit[#," "],columns],chessman]&/@solvePack1[[k;;k+1]];(*\:7b2ck\:6b65\:5c06\:88ab\:79fb\:52a8\:7684\:68cb\:5b50\:7684\:5f53\:524d\:4f4d\:7f6e\:4e0e\:76ee\:6807\:4f4d\:7f6e*)
chessmanDirection=Sign[Differences[chessmanPosCD]]/.toUDLR;(*\:88ab\:79fb\:52a8\:7684\:68cb\:5b50\:7684\:79fb\:52a8\:65b9\:5411\:ff0c\:4e0a\:4e0b\:5de6\:53f3\:ff1aUDLR *)
chessman<>">"<>chessmanDirection,{k,nn}]," "]];

(*\:8bfb\:53d6\:7b80\:8bb0\:7801\:ff1a\:5c06\:7b80\:8bb0\:7801\:8f6c\:6210\:72b6\:6001\:5f62\:5f0f\:7684\:89e3\:3002*)
fromBriefCode[BriefCode_,columns_]:=Module[{startDataSL=StringCases[BriefCode,x__~~":":>x][[1]],process=StringCases[BriefCode,":"~~x__:>x][[1]],letter,pos,direction,lsTable,startData,pro,k,kk},
startData=Partition[StringSplit[startDataSL," "],columns];(*\:5c06\:5f00\:5c40\:8f6c\:6210\:5b57\:6bcd\:77e9\:9635\:5f62\:5f0f*)
pro=StringSplit[#,">"]&/@StringSplit[process," "];(*\:5c06\:5904\:7406\:8fc7\:7a0b\:8f6c\:4e3a\:77e9\:9635\:5b57\:6bcd\:5f62\:5f0f*)
lsTable=Table[letter=pro[[k,1]];(*\:7b2ck\:6b21\:9700\:8981\:5904\:7406\:7684\:5b57\:6bcd*)
pos=Position[startData,letter];(*\:5b57\:6bcd\:7684\:6240\:6709\:4f4d\:7f6e*)
direction=pro[[k,2]]/.fromUDLR;
Do[startData[[Sequence@@pos[[kk]]]]="#";,{kk,Length[pos]}];(*\:7528#\:586b\:5145\:539f\:59cb\:4f4d\:7f6e*)
Do[startData[[Sequence@@(pos[[kk]]+direction)]]=letter;,{kk,Length[pos]}];(*\:7528\:5b57\:6bcd\:586b\:5145\:65b0\:4f4d\:7f6e*)
StringRiffle[Flatten[startData]," "](*\:8fd4\:56de\:7b2ck\:6b21\:5904\:7406\:540e\:5b57\:6bcd\:5f62\:5f0f\:7684\:5c40\:9762*)
,{k,Length[pro]}];(*\:6267\:884c\:6bcf\:4e2a\:5904\:7406\:8fc7\:7a0b*)
Return[{startDataSL}~Join~lsTable];];

(*{\:68cb\:5b50\:503c\:ff0c{\:53ca\:5176\:76ee\:6807\:7a7a\:4f4d\:7684\:5750\:6807}\:ff0c{\:53ca\:5176\:817e\:51fa\:7a7a\:4f4d\:7684\:5750\:6807}}*)
chessmanToPosFromPos[solveStatus1_,columns_]:=Module[{nn=Length[solveStatus1]-1,trueFalse,chessman,fromPosToPos,toPos,fromPos},
Table[
trueFalse=MapThread[Unequal,StringSplit[#," "]&/@solveStatus1[[k;;k+1]]];(*\:6807\:8bb0\:5728\:7b2ck\:6b65\:5c06\:88ab\:79fb\:52a8\:7684\:68cb\:5b50\:ff0c\:542b\:7a7a\:4f4d\:ff0c\:6709\:91cd\:590d*)
chessman=FirstCase[Pick[StringSplit[solveStatus1[[k]]," "],trueFalse],Except["#"]];(*\:7b2ck\:6b65\:5c06\:88ab\:79fb\:52a8\:7684\:68cb\:5b50*)
fromPosToPos=Position[Partition[StringSplit[#," "],columns],chessman]&/@solveStatus1[[{k+1,k}]];(*\:7b2ck\:6b65\:5c06\:88ab\:79fb\:52a8\:7684\:68cb\:5b50\:7684\:5f53\:524d\:4f4d\:7f6e\:4e0e\:76ee\:6807\:4f4d\:7f6e*)
toPos=Complement@@fromPosToPos;(*\:76ee\:6807\:7a7a\:4f4d*)
fromPos=Complement@@RotateLeft[fromPosToPos];(*\:817e\:51fa\:7684\:7a7a\:4f4d*)
{chessman,toPos,fromPos},{k,nn}]];

End[ ]
EndPackage[ ]
