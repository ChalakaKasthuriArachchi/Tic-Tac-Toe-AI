function varargout = tic_tac_toe(varargin)
% TIC_TAC_TOE MATLAB code for tic_tac_toe.fig
%      TIC_TAC_TOE, by itself, creates a new TIC_TAC_TOE or raises the existing
%      singleton*.
%
%      H = TIC_TAC_TOE returns the handle to a new TIC_TAC_TOE or the handle to
%      the existing singleton*.
%
%      TIC_TAC_TOE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TIC_TAC_TOE.M with the given input arguments.
%
%      TIC_TAC_TOE('Property','Value',...) creates a new TIC_TAC_TOE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tic_tac_toe_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tic_tac_toe_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tic_tac_toe

% Last Modified by GUIDE v2.5 12-Jan-2019 18:03:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tic_tac_toe_OpeningFcn, ...
                   'gui_OutputFcn',  @tic_tac_toe_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before tic_tac_toe is made visible.
function tic_tac_toe_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tic_tac_toe (see VARARGIN)

% Choose default command line output for tic_tac_toe
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tic_tac_toe wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tic_tac_toe_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global controls;
global img1;
global img2;
global img1H;
global img2H;
global imgBackAct;
global imgBackInact;
global buttons;
img1 = imread('cross2.png');
img2 = imread('circle2.png');
img1H = img1;
img2H = img2;
imgBackAct = imread('backActive.png');
imgBackInact = imread('backInactive.png');
buttons = [handles.pb1 handles.pb2 handles.pb3 handles.pb4 handles.pb5 handles.pb6 handles.pb7 handles.pb8 handles.pb9];
for i=1:65
    for j=1:65
        if img1H(i,j,1) == 255 && img1H(i,j,2) == 255 && img1H(i,j,3) == 255
            img1H(i,j,3) = 0;
        end
        if img2H(i,j,1) == 255 && img2H(i,j,2) == 255 && img2H(i,j,3) == 255
            img2H(i,j,3) = 0;
        end
    end
end
controls = handles;
% Get default command line output from handles structure
varargout{1} = handles.output;
newGame();


% --- Executes on button press in pb1.
function pb1_Callback(hObject, ~, ~)
global img1;
set(hObject,'CData',img1,'enable','Inactive');
setPlayer(2,1);
continueGame(2);

% --- Executes on button press in pb2.
function pb2_Callback(hObject, ~, ~)
global img1;
set(hObject,'CData',img1,'enable','Inactive');
setPlayer(2,2);
continueGame(2);

% --- Executes on button press in pb3.
function pb3_Callback(hObject, ~, ~)
global img1;
set(hObject,'CData',img1,'enable','Inactive');
setPlayer(2,3);
continueGame(2);

% --- Executes on button press in pb4.
function pb4_Callback(hObject, ~, ~)
global img1;
set(hObject,'CData',img1,'enable','Inactive');
setPlayer(2,4);
continueGame(2);

% --- Executes on button press in pb5.
function pb5_Callback(hObject, ~, ~)
global img1;
set(hObject,'CData',img1,'enable','Inactive');
setPlayer(2,5);
continueGame(2);

% --- Executes on button press in pb6.
function pb6_Callback(hObject, ~, ~)
global img1;
set(hObject,'CData',img1,'enable','Inactive');
setPlayer(2,6);
continueGame(2);

% --- Executes on button press in pb7.
function pb7_Callback(hObject, ~, ~)
global img1;
set(hObject,'CData',img1,'enable','Inactive');
setPlayer(2,7);
continueGame(1);

% --- Executes on button press in pb8.
function pb8_Callback(hObject, ~, ~)
global img1;
set(hObject,'CData',img1,'enable','Inactive');
setPlayer(2,8);
continueGame(2);

% --- Executes on button press in pb9.
function pb9_Callback(hObject, ~, ~)
global img1;
set(hObject,'CData',img1,'enable','Inactive');
setPlayer(2,9);
continueGame(2);

function setPlayer(pID,sqr)
    global matrix;
    global pList;
    global c;
    temp = mod(sqr,3);
    if temp == 0
        temp = 3;
    end
    pList(pID,c(pID),1) = floor(sqr/3.5) + 1;
    pList(pID,c(pID),2) = temp;
    matrix(temp,floor(sqr/3.5) + 1) = pID; 
    c(pID) = c(pID) + 1;
    
function setTempPlayer(pID,sqr)
    global tempMatrix;
    global tempList;
    global tempC;
    temp = mod(sqr,3);
    if temp == 0
        temp = 3;
    end
    tempList(pID,tempC(pID),1) = floor(sqr/3.5) + 1;
    tempList(pID,tempC(pID),2) = temp;
    tempMatrix(temp,floor(sqr/3.5) + 1) = pID; 
    tempC(pID) = tempC(pID) + 1;
    
function x=getWinner(pID,list,c)
    global imgInact;
    x = isWon(pID,list,c);
    if(x == 1)
        if(pID == 1)
            highlightButtons(pID);
            setEnable('Inactive');
            msgbox('Com Won the Game');
        else
            highlightButtons(pID);
            setEnable('Inactive');
            msgbox('You won the Game');
        end
    end
function highlightButtons(pID)
    global hs;
    global buttons;
    global img1H;
    global img2H;
    for i=1:3
        if pID == 1
            set(buttons(hs(i)),'CData',img2H);
        else
            set(buttons(hs(i)),'CData',img1H);
        end
    end
    
function setEnable(state) 
    global buttons;
    for i=1:9
        set(buttons(i),'enable',state);
    end
function newGame()
    global c;
    global pList;
    global tempC;
    global tempList;
    global matrix;
    global tempMatrix;
    global buttons;
    global imgBackAct;
    global hs;
    global hsC;
    for i=1:9
        set(buttons(i),'CData',imgBackAct,'enable','on');
    end
    c = [1 1];
    tempC = [1 1];
    hs = [1 1 1];
    hsC = 1;
    pList = [0 0;0 0;0 0;0 0;0 0];
    tempList = [0 0;0 0;0 0;0 0;0 0];
    matrix = [0 0 0;0 0 0;0 0 0];
    tempMatrix = matrix;
    
function x=isWon(pID,list,c)
    global hs;
    x = 1;
    count = 1;
    if c < 3
        x = 0;
        return;
    end
%Testing 1st Column
    tmp = list(1,1,1);
    hs(count) = (list(1,1,1) - 1) * 3 + list(1,1,2);
    for i = 2:c
        if list(1,i,1) == tmp
            count = count + 1;
            hs(count) = (list(1,i,1) - 1) * 3 + list(1,i,2);
        end
    end
    if count == 3
        return;
    end
    count = 1;
    
%Testing 2nd Column
    tmp = list(1,1,2);
    hs(count) = (list(1,1,1) - 1) * 3 + list(1,1,2);
    for i = 2:c
        if list(1,i,2) == tmp
            count = count + 1;
            hs(count) = (list(1,i,1) - 1) * 3 + list(1,i,2);
        end
    end
    if count == 3
        return;
    end
    count = 0;
%Main Diagonal
    for i = 1:c
        if list(1,i,1) == list(1,i,2)
            count = count + 1;
            hs(count) = (list(1,i,2) - 1) * 3 + list(1,i,1);
        end
    end
    if count == 3
        return;
    end
    count = 0;
%Sub Diagonal
    for i = 1:c
        if list(1,i,1) + list(1,i,2) == 4
            count = count + 1;
            hs(count) = (list(1,i,1) - 1) * 3 + list(1,i,2);
        end
    end
    if count == 3
        return;
    end
    x = 0;
        
% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
    newGame();
    
function continueGame(pID)
    global pList;
    global matrix;
    global tempMatrix;
    global c;
    bestAdv = 0;
    bestSqr = 0;
    oAdv = 0;
    oSqr = 0;
    
    if(getWinner(2,pList(2,:,:),c(2) - 1) ==  0)
        for i=1:9
            if isFree(i,matrix)
                resetTemps();
                setTempPlayer(2,i);
                adv = getTotalAdv(pList(2),tempMatrix);
                if adv == 100
                    oAdv = adv;
                    oSqr = i;
                    break;
                elseif((adv == oAdv && randi(2,1,1) == 1)||(adv > oAdv))
                    oAdv = adv;
                    oSqr = i;
                elseif oSqr == 0
                    oAdv = adv;
                    oSqr = i;
                end
            end
        end
        
        for i=1:9
            if isFree(i,matrix)
                resetTemps();
                setTempPlayer(1,i);
                adv = getTotalAdv(pList(2),tempMatrix);
                if abs(adv) == 100 %One Move Win or Block
                    setMove(i);
                    if(getWinner(1,pList(1,:,:),c(1) - 1) ==  1)
                        return;
                    end
                elseif((adv == bestAdv && randi(2,1,1) == 1)||(adv > bestAdv))
                    bestAdv = adv;
                    bestSqr = i;
                elseif bestSqr == 0
                    bestAdv = adv;
                    bestSqr = i;
                end
            end
        end
    end
    if c(1) == 5
        msgbox('Game Tied!');
    else
        if oAdv == 100
            setMove(oSqr);
        else
            setMove(bestSqr);
        end
        if(getWinner(1,pList(1,:,:),c(1) - 1) ==  1)
            return;
        end
    end
    
function resetTemps
    global tempMatrix;
    global tempC;
    global tempList;
    global matrix;
    tempMatrix = matrix;
    tempC = [1 1];
    tempList = [0 0;0 0;0 0;0 0;0 0];
    
function setMove(sqr)
    global controls;
    global img2;
    global buttons;
    setPlayer(1,sqr);
    set(buttons(sqr),'CData',img2,'enable','Inactive');
        
function adv=getTotalAdv(list,matrix)
    adv = 0;
    %Testing Columns 
    for i = 1:3
        temp = getLineAdv(matrix(i,:));
        if(abs(temp) == 100)
            adv = temp;
            return
        else
            adv = adv + temp;
        end
    end
    %Testing Rows
    for i = 1:3
        temp = getLineAdv(matrix(:,i));
        if(abs(temp) == 100)
            adv = temp;
            return;
        else
            adv = adv + temp;
        end
    end
    %Testing MainDiagonal
        temp = getLineAdv(diag(matrix));
        if(abs(temp) == 100)
            adv = temp;
            return
        else
            adv = adv + temp;
        end
    %Testing SubDiagonal
        temp = getLineAdv([matrix(3) matrix(5) matrix(7)]);
        if(abs(temp) == 100)
            adv = temp;
            return
        else
            adv = adv + temp;
        end
    
function adv=getLineAdv(list)
    %spaces = 0;
    %p1 = 0;
    %p2 = 0;
    adv = 0;
    count = [0 0 0];
    for i=1:3
       t = list(i);
       count(t + 1) = count(t + 1) + 1;
    end
    if count(2) == 3 %P1 WON
        adv = 100;
    elseif count(3) == 3 %P2 WON
        adv = -100;
    elseif count(1) == 1 %1 Space
        if count(2) == 2 
            adv = 10;
        elseif count(3) == 2
            adv = -10;
        end
    elseif count(1) == 2
        if count(2) == 1
            adv = 1;
        elseif count(3) == 1
            adv = -1;
        end
    end
    
function x=isFree(sqr,matrix)
    x = (matrix(sqr) == 0);
