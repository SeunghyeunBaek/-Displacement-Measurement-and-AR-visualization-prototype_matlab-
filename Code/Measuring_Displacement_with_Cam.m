
function varargout = Measuring_Displacement_with_Cam(varargin)
% MEASURING_DISPLACEMENT_WITH_CAM MATLAB code for Measuring_Displacement_with_Cam.fig
%      MEASURING_DISPLACEMENT_WITH_CAM, by itself, creates a new MEASURING_DISPLACEMENT_WITH_CAM or raises the existing
%      singleton*.
%
%      H = MEASURING_DISPLACEMENT_WITH_CAM returns the handle to a new MEASURING_DISPLACEMENT_WITH_CAM or the handle to
%      the existing singleton*.
%
%      MEASURING_DISPLACEMENT_WITH_CAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MEASURING_DISPLACEMENT_WITH_CAM.M with the given input arguments.
%
%      MEASURING_DISPLACEMENT_WITH_CAM('Property','Value',...) creates a new MEASURING_DISPLACEMENT_WITH_CAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before axes3 gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to axes3 via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Measuring_Displacement_with_Cam

% Last Modified by GUIDE v2.5 21-May-2017 18:22:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Measuring_Displacement_with_Cam_OpeningFcn, ...
                   'gui_OutputFcn',  @Measuring_Displacement_with_Cam_OutputFcn, ...
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


% --- Executes just before Measuring_Displacement_with_Cam is made visible.
function Measuring_Displacement_with_Cam_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Measuring_Displacement_with_Cam (see VARARGIN)

% Choose default command line output for Measuring_Displacement_with_Cam
handles.output = hObject;
%axes(handles.axes3);
%vid=videoinput('winvideo',1,'YUY2_640x480');
%hImage=image(zeros(480,640,1),'Parent',handles.axes3);
%set(vid, 'ReturnedColorspace','rgb');
%vid.FrameGrabInterval = 2;
%start(vid);
%preview(vid,hImage);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Measuring_Displacement_with_Cam wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = Measuring_Displacement_with_Cam_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function Start_btn_Callback(hObject, eventdata, handles)

%빨간색 이미지 트래킹

Calculation_Loop


function Stop_btn_Callback(hObject, eventdata, handles)

%시스템 종료 및 데이터 저장
global flag;
global vid;
global dat;

dlmwrite('temp.txt',dat,'\t');

flag = 1;

stoppreview(vid);
stop(vid);
flushdata(vid);




function Get_Coord_btn_Callback(hObject, eventdata, handles)

% 초기값 저장 - init_x, init_y
% 다리 거리 계산

Get_Init_Coord

function init_coord_etxt_Callback(hObject, eventdata, handles)

function init_coord_etxt_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function Get_Cam_Callback(hObject, eventdata, handles)

%캠 불러오기

Get_Cam


function input_val_Callback(hObject, eventdata, handles)

function input_val_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function P_length_etxt_Callback(hObject, eventdata, handles)

function P_length_etxt_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Ratio_etxt_Callback(hObject, eventdata, handles)

function Ratio_etxt_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Var_etxt_Callback(hObject, eventdata, handles)

function Var_etxt_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function R_length_btn_Callback(hObject, eventdata, handles)
% 실제 길이값 받기

global r_length;
r_length = str2double(get(handles.input_val,'String'));

function edit6_Callback(hObject, eventdata, handles)

function edit6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Cal_Ratio_btn_Callback(hObject, eventdata, handles)

%mm/pixel 계산

Cal_Ratio

function Coordinate_etxt_Callback(hObject, eventdata, handles)
% hObject    handle to Coordinate_etxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Coordinate_etxt as text
%        str2double(get(hObject,'String')) returns contents of Coordinate_etxt as a double

% --- Executes during object creation, after setting all properties.
function Coordinate_etxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Coordinate_etxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --------------------------------------------------------------------
function Displacement_Measuring_with_Cam_Callback(hObject, eventdata, handles)
% hObject    handle to Measuring_Displacement_with_Cam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit11_Callback(hObject, eventdata, handles)

% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double

% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
