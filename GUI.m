function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 27-Dec-2020 13:38:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
N=str2double(get(hObject,'String'));
data = zeros(N,N+1);
t = uitable(GUI,'data',data);

D=cell(N+1,1);
for i = 1 : N
    D(i) = {strcat('X',num2str(i,'%d'))};
end
D(N+1)={'B'};
set(t,'ColumnName',D);
set(t,'ColumnEditable',true(1,N+1));



  %end
%end
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)


% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
path=get(handles.edit4,'String');
if (size(path)~=0)
    data=dlmread(path);
else
tH = findobj(GUI,'Type','uitable');
        data = get(tH,'Data');
end
        if (size(data) == 0)
            disp('Please Choose Number of Equations');
            
        else
            %data = cell2mat(num2cell(data));
            choice = handles.popupmenu1.Value;
            
            switch(choice)
                case 1
                    [err, answer, sim] = Gauss.gauss(data,0.0001,true);
                case 2
                    [err, answer, sim] = Gauss.gaussWithPivoting(data,0.0001,true);
                case 3
                    [err, answer, sim] = Gauss.gaussJordan(data,0.0001,true);
               case 4
                    choice2 = handles.popupmenu2.Value;
                    switch(choice2)
                        case 1
                            [L, U, err, sim] = LU.Doolittle(data(:,(1:size(data,2)-1)));
                        case 2
                            [L, U, err, sim] = LU.Crout(data(:,(1:size(data,2)-1)));
                        case 3
                            [L, err, sim] = LU.Cholesky(data(:,(1:size(data,2)-1)));
                            U = transpose(L);
                    end
                    if(err == 0)
                        [answer, err, sim2] = LU.solveLU(L,U,data(:,size(data,2)));
                        sim = sprintf('%s \n%s', sim, sim2);
                    end
                case 5
                    choice2 = handles.uibuttongroup1.SelectedObject.Tag;
                    condition = handles.edit2.String;
                    x = transpose(str2num(handles.edit3.String));
                    x
                    condition
                    data(:,(1:size(data,2)-1))
                    data(:,size(data,2))
                    if (condition ~= 0)
                        if (choice2 == 'radiobutton1')
                            [answer, sim] = Iterative.jacobiSolve1(data(:,(1:size(data,2)-1)),x,data(:,size(data,2)),condition);
                            err=0;
                        else
                            [answer, sim] = Iterative.jacobiSolve2(data(:,(1:size(data,2)-1)),x,data(:,size(data,2)),condition);
                            err=0;
                        end
                    else
                        err = -1;
                    end
                    
                case 6
                    choice2 = handles.uibuttongroup1.SelectedObject.Tag;
                    condition = handles.edit2.String;
                    x = transpose(str2num(handles.edit3.String));
                    if (condition ~= 0)
                        if (choice2 == 'radiobutton1')
                            [answer, sim] = Iterative.GaussSeidelSolve1(data(:,(1:size(data,2)-1)),x,data(:,size(data,2)),condition);
                        else
                            [answer, sim] = Iterative.GaussSeidelSolve2(data(:,(1:size(data,2)-1)),x,data(:,size(data,2)),condition);
                        end
                    else
                        err = -1;
                    end
            end

            if (err == -1)
                disp('Please Choose a stopping criteria')
            elseif (err==0)
                value = get(handles.checkbox1,'Value');
                if (value)
                    Display(sim);
                end
                disp('Answer is:')
                disp(answer)
                answer = transpose(answer);
                x = '';
                i = 1;
                for a = answer
                    disp(a)
                    x = strcat(x, 'x', num2str(i,'%d'), {' = '} ,mat2str(a) , {'        '});
                    i = i+1;
                end
                set(handles.text5, 'String', x)
            else
                disp('System might not have unique solution')
            end
        end
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
%contents = cellstr(get(hObject,'String'));
set(handles.popupmenu2,'visible','off');
set(handles.edit2,'visible','off');
set(handles.uibuttongroup1,'visible','off');
set(handles.edit3,'visible','off');
set(handles.text7,'visible','off');
set(handles.text4,'visible','off');

if get(hObject,'Value')==4
    set(handles.popupmenu2,'visible','on');
    set(handles.text7,'visible','on');
elseif get(hObject,'Value')==5 || get(hObject,'Value')==6
    set(handles.edit2,'visible','on');
    set(handles.uibuttongroup1,'visible','on');
    set(handles.text4,'visible','on');
    set(handles.edit3,'visible','on');


end

% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
% --- Executes during object creation, after setting all properties.

       



function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'visible','off');
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
% --- Executes during object creation, after setting all properties.

function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'visible','off');
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes during object creation, after setting all properties.
function uibuttongroup1_CreateFcn(hObject, eventdata, handles)
set(hObject,'visible','off');
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'visible','off');
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
set(hObject,'visible','off');
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)
%display answer here###########################
%set(handles.text5, 'String', answer) ;
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text7_CreateFcn(hObject, eventdata, handles)
set(hObject,'visible','off');
% hObject    handle to text7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
set(hObject,'visible','off');
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uibuttongroup2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
if(get(hObject,'Value')==1)
    set(handles.edit1,'visible','off');
    set(handles.edit4,'visible','on');
end
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
if(get(hObject,'Value')==1)
    set(handles.edit1,'visible','on');
    set(handles.edit4,'visible','off');
end

% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
