import core.stdc.config;
import core.stdc.stdio;
import core.stdc.stdarg;

extern (C):

struct ImVec2_Simple
{
    float x;
    float y;
}

struct ImVec4_Simple
{
    float x;
    float y;
    float z;
    float w;
}

struct ImColor_Simple
{
    ImVec4_Simple Value;
}

alias ImDrawIdx = ushort;
struct ImGuiContext;
struct ImDrawListSharedData;

alias ImTextureID = void*;
alias ImGuiID = uint;
alias ImWchar = ushort;
alias ImGuiInputTextCallback = int function (ImGuiInputTextCallbackData* data);
alias ImGuiSizeCallback = void function (ImGuiSizeCallbackData* data);
alias ImS32 = int;
alias ImU32 = uint;
alias ImS64 = c_long;
alias ImU64 = c_ulong;

struct ImVec2
{
    float x;
    float y;
}

struct ImVec4
{
    float x;
    float y;
    float z;
    float w;
}

enum ImGuiWindowFlags
{
    none = 0,
    noTitleBar = 1,
    noResize = 2,
    noMove = 4,
    noScrollbar = 8,
    noScrollWithMouse = 16,
    noCollapse = 32,
    alwaysAutoResize = 64,
    noBackground = 128,
    noSavedSettings = 256,
    noMouseInputs = 512,
    menuBar = 1024,
    horizontalScrollbar = 2048,
    noFocusOnAppearing = 4096,
    noBringToFrontOnFocus = 8192,
    alwaysVerticalScrollbar = 16384,
    alwaysHorizontalScrollbar = 32768,
    alwaysUseWindowPadding = 65536,
    noNavInputs = 262144,
    noNavFocus = 524288,
    unsavedDocument = 1048576,
    noNav = 786432,
    noDecoration = 43,
    noInputs = 786944,
    navFlattened = 8388608,
    childWindow = 16777216,
    tooltip = 33554432,
    popup = 67108864,
    modal = 134217728,
    childMenu = 268435456
}

enum ImGuiInputTextFlags
{
    none = 0,
    charsDecimal = 1,
    charsHexadecimal = 2,
    charsUppercase = 4,
    charsNoBlank = 8,
    autoSelectAll = 16,
    enterReturnsTrue = 32,
    callbackCompletion = 64,
    callbackHistory = 128,
    callbackAlways = 256,
    callbackCharFilter = 512,
    allowTabInput = 1024,
    ctrlEnterForNewLine = 2048,
    noHorizontalScroll = 4096,
    alwaysInsertMode = 8192,
    readOnly = 16384,
    password = 32768,
    noUndoRedo = 65536,
    charsScientific = 131072,
    callbackResize = 262144,
    multiline = 1048576
}

enum ImGuiTreeNodeFlags
{
    none = 0,
    selected = 1,
    framed = 2,
    allowItemOverlap = 4,
    noTreePushOnOpen = 8,
    noAutoOpenOnLog = 16,
    defaultOpen = 32,
    openOnDoubleClick = 64,
    openOnArrow = 128,
    leaf = 256,
    bullet = 512,
    framePadding = 1024,
    navLeftJumpsBackHere = 8192,
    collapsingHeader = 26
}

enum ImGuiSelectableFlags
{
    none = 0,
    dontClosePopups = 1,
    spanAllColumns = 2,
    allowDoubleClick = 4,
    disabled = 8
}

enum ImGuiComboFlags
{
    none = 0,
    popupAlignLeft = 1,
    heightSmall = 2,
    heightRegular = 4,
    heightLarge = 8,
    heightLargest = 16,
    noArrowButton = 32,
    noPreview = 64,
    heightMask = 30
}

enum ImGuiTabBarFlags
{
    none = 0,
    reorderable = 1,
    autoSelectNewTabs = 2,
    noCloseWithMiddleMouseButton = 4,
    noTabListPopupButton = 8,
    noTabListScrollingButtons = 16,
    noTooltip = 32,
    fittingPolicyResizeDown = 64,
    fittingPolicyScroll = 128,
    fittingPolicyMask = 192,
    fittingPolicyDefault = 64
}

enum ImGuiTabItemFlags
{
    none = 0,
    unsavedDocument = 1,
    setSelected = 2,
    noCloseWithMiddleMouseButton = 4,
    noPushId = 8
}

enum ImGuiFocusedFlags
{
    none = 0,
    childWindows = 1,
    rootWindow = 2,
    anyWindow = 4,
    rootAndChildWindows = 3
}

enum ImGuiHoveredFlags
{
    none = 0,
    childWindows = 1,
    rootWindow = 2,
    anyWindow = 4,
    allowWhenBlockedByPopup = 8,
    allowWhenBlockedByActiveItem = 32,
    allowWhenOverlapped = 64,
    allowWhenDisabled = 128,
    rectOnly = 104,
    rootAndChildWindows = 3
}

enum ImGuiDragDropFlags
{
    none = 0,
    sourceNoPreviewTooltip = 1,
    sourceNoDisableHover = 2,
    sourceNoHoldToOpenOthers = 4,
    sourceAllowNullID = 8,
    sourceExtern = 16,
    sourceAutoExpirePayload = 32,
    acceptBeforeDelivery = 1024,
    acceptNoDrawDefaultRect = 2048,
    acceptNoPreviewTooltip = 4096,
    acceptPeekOnly = 3072
}

enum ImGuiDataType
{
    s32 = 0,
    u32 = 1,
    s64 = 2,
    u64 = 3,
    float_ = 4,
    double_ = 5,
    count = 6
}

enum ImGuiDir
{
    none = -1,
    left = 0,
    right = 1,
    up = 2,
    down = 3,
    count = 4
}

enum ImGuiKey
{
    tab = 0,
    leftArrow = 1,
    rightArrow = 2,
    upArrow = 3,
    downArrow = 4,
    pageUp = 5,
    pageDown = 6,
    home = 7,
    end = 8,
    insert = 9,
    delete_ = 10,
    backspace = 11,
    space = 12,
    enter = 13,
    escape = 14,
    a = 15,
    c = 16,
    v = 17,
    x = 18,
    y = 19,
    z = 20,
    count = 21
}

enum ImGuiNavInput
{
    activate = 0,
    cancel = 1,
    input = 2,
    menu = 3,
    dpadLeft = 4,
    dpadRight = 5,
    dpadUp = 6,
    dpadDown = 7,
    lStickLeft = 8,
    lStickRight = 9,
    lStickUp = 10,
    lStickDown = 11,
    focusPrev = 12,
    focusNext = 13,
    tweakSlow = 14,
    tweakFast = 15,
    keyMenu = 16,
    keyLeft = 17,
    keyRight = 18,
    keyUp = 19,
    keyDown = 20,
    count = 21,
    internalStart = 16
}

enum ImGuiConfigFlags
{
    none = 0,
    navEnableKeyboard = 1,
    navEnableGamepad = 2,
    navEnableSetMousePos = 4,
    navNoCaptureKeyboard = 8,
    noMouse = 16,
    noMouseCursorChange = 32,
    isSRGB = 1048576,
    isTouchScreen = 2097152
}

enum ImGuiBackendFlags
{
    none = 0,
    hasGamepad = 1,
    hasMouseCursors = 2,
    hasSetMousePos = 4
}


enum ImGuiCol
{
    text = 0,
    textDisabled = 1,
    windowBg = 2,
    childBg = 3,
    popupBg = 4,
    border = 5,
    borderShadow = 6,
    frameBg = 7,
    frameBgHovered = 8,
    frameBgActive = 9,
    titleBg = 10,
    titleBgActive = 11,
    titleBgCollapsed = 12,
    menuBarBg = 13,
    scrollbarBg = 14,
    scrollbarGrab = 15,
    scrollbarGrabHovered = 16,
    scrollbarGrabActive = 17,
    checkMark = 18,
    sliderGrab = 19,
    sliderGrabActive = 20,
    button = 21,
    buttonHovered = 22,
    buttonActive = 23,
    header = 24,
    headerHovered = 25,
    headerActive = 26,
    separator = 27,
    separatorHovered = 28,
    separatorActive = 29,
    resizeGrip = 30,
    resizeGripHovered = 31,
    resizeGripActive = 32,
    tab = 33,
    tabHovered = 34,
    tabActive = 35,
    tabUnfocused = 36,
    tabUnfocusedActive = 37,
    plotLines = 38,
    plotLinesHovered = 39,
    plotHistogram = 40,
    plotHistogramHovered = 41,
    textSelectedBg = 42,
    dragDropTarget = 43,
    navHighlight = 44,
    navWindowingHighlight = 45,
    navWindowingDimBg = 46,
    modalWindowDimBg = 47,
    count = 48
}

enum ImGuiStyleVar
{
    alpha = 0,
    windowPadding = 1,
    windowRounding = 2,
    windowBorderSize = 3,
    windowMinSize = 4,
    windowTitleAlign = 5,
    childRounding = 6,
    childBorderSize = 7,
    popupRounding = 8,
    popupBorderSize = 9,
    framePadding = 10,
    frameRounding = 11,
    frameBorderSize = 12,
    itemSpacing = 13,
    itemInnerSpacing = 14,
    indentSpacing = 15,
    scrollbarSize = 16,
    scrollbarRounding = 17,
    grabMinSize = 18,
    grabRounding = 19,
    tabRounding = 20,
    buttonTextAlign = 21,
    count = 22
}

enum ImGuiColorEditFlags
{
    none = 0,
    noAlpha = 2,
    noPicker = 4,
    noOptions = 8,
    noSmallPreview = 16,
    noInputs = 32,
    noTooltip = 64,
    noLabel = 128,
    noSidePreview = 256,
    noDragDrop = 512,
    alphaBar = 65536,
    alphaPreview = 131072,
    alphaPreviewHalf = 262144,
    hdr = 524288,
    rgb = 1048576,
    hsv = 2097152,
    hex = 4194304,
    uint8 = 8388608,
    float_ = 16777216,
    pickerHueBar = 33554432,
    pickerHueWheel = 67108864,
    inputsMask = 7340032,
    dataTypeMask = 25165824,
    pickerMask = 100663296,
    optionsDefault = 42991616
}

enum ImGuiMouseCursor
{
    none = -1,
    arrow = 0,
    textInput = 1,
    resizeAll = 2,
    resizeNS = 3,
    resizeEW = 4,
    resizeNESW = 5,
    resizeNWSE = 6,
    hand = 7,
    count = 8
}

enum ImGuiCond
{
    always = 1,
    once = 2,
    firstUseEver = 4,
    appearing = 8
}

struct ImVector
{
    int Size;
    int Capacity;
    void* Data;
}

struct ImVector_float
{
    int Size;
    int Capacity;
    float* Data;
}

struct ImVector_ImWchar
{
    int Size;
    int Capacity;
    ImWchar* Data;
}

struct ImVector_ImFontConfig
{
    int Size;
    int Capacity;
    ImFontConfig* Data;
}

struct ImVector_ImFontGlyph
{
    int Size;
    int Capacity;
    ImFontGlyph* Data;
}

struct ImVector_TextRange
{
    int Size;
    int Capacity;
    TextRange* Data;
}

struct ImVector_CustomRect
{
    int Size;
    int Capacity;
    CustomRect* Data;
}

struct ImVector_ImDrawChannel
{
    int Size;
    int Capacity;
    ImDrawChannel* Data;
}

struct ImVector_char
{
    int Size;
    int Capacity;
    char* Data;
}

struct ImVector_ImTextureID
{
    int Size;
    int Capacity;
    ImTextureID* Data;
}

struct ImVector_ImDrawVert
{
    int Size;
    int Capacity;
    ImDrawVert* Data;
}

struct ImVector_int
{
    int Size;
    int Capacity;
    int* Data;
}

struct ImVector_Pair
{
    int Size;
    int Capacity;
    Pair* Data;
}

struct ImVector_ImFontPtr
{
    int Size;
    int Capacity;
    ImFont** Data;
}

struct ImVector_ImVec4
{
    int Size;
    int Capacity;
    ImVec4* Data;
}

struct ImVector_ImDrawCmd
{
    int Size;
    int Capacity;
    ImDrawCmd* Data;
}

struct ImVector_ImDrawIdx
{
    int Size;
    int Capacity;
    ImDrawIdx* Data;
}

struct ImVector_ImVec2
{
    int Size;
    int Capacity;
    ImVec2* Data;
}

struct ImGuiStyle
{
    float Alpha;
    ImVec2 WindowPadding;
    float WindowRounding;
    float WindowBorderSize;
    ImVec2 WindowMinSize;
    ImVec2 WindowTitleAlign;
    float ChildRounding;
    float ChildBorderSize;
    float PopupRounding;
    float PopupBorderSize;
    ImVec2 FramePadding;
    float FrameRounding;
    float FrameBorderSize;
    ImVec2 ItemSpacing;
    ImVec2 ItemInnerSpacing;
    ImVec2 TouchExtraPadding;
    float IndentSpacing;
    float ColumnsMinSpacing;
    float ScrollbarSize;
    float ScrollbarRounding;
    float GrabMinSize;
    float GrabRounding;
    float TabRounding;
    float TabBorderSize;
    ImVec2 ButtonTextAlign;
    ImVec2 DisplayWindowPadding;
    ImVec2 DisplaySafeAreaPadding;
    float MouseCursorScale;
    bool AntiAliasedLines;
    bool AntiAliasedFill;
    float CurveTessellationTol;
    ImVec4[ImGuiCol.count] Colors;
}

struct ImGuiIO
{
    ImGuiConfigFlags ConfigFlags;
    ImGuiBackendFlags BackendFlags;
    ImVec2 DisplaySize;
    float DeltaTime;
    float IniSavingRate;
    const(char)* IniFilename;
    const(char)* LogFilename;
    float MouseDoubleClickTime;
    float MouseDoubleClickMaxDist;
    float MouseDragThreshold;
    int[ImGuiKey.count] KeyMap;
    float KeyRepeatDelay;
    float KeyRepeatRate;
    void* UserData;
    ImFontAtlas* Fonts;
    float FontGlobalScale;
    bool FontAllowUserScaling;
    ImFont* FontDefault;
    ImVec2 DisplayFramebufferScale;
    ImVec2 DisplayVisibleMin;
    ImVec2 DisplayVisibleMax;
    bool MouseDrawCursor;
    bool ConfigMacOSXBehaviors;
    bool ConfigInputTextCursorBlink;
    bool ConfigWindowsResizeFromEdges;
    bool ConfigWindowsMoveFromTitleBarOnly;
    const(char)* BackendPlatformName;
    const(char)* BackendRendererName;
    void* BackendPlatformUserData;
    void* BackendRendererUserData;
    void* BackendLanguageUserData;
    const(char)* function (void* user_data) GetClipboardTextFn;
    void function (void* user_data, const(char)* text) SetClipboardTextFn;
    void* ClipboardUserData;
    void function (int x, int y) ImeSetInputScreenPosFn;
    void* ImeWindowHandle;
    void* RenderDrawListsFnUnused;
    ImVec2 MousePos;
    bool[5] MouseDown;
    float MouseWheel;
    float MouseWheelH;
    bool KeyCtrl;
    bool KeyShift;
    bool KeyAlt;
    bool KeySuper;
    bool[512] KeysDown;
    float[ImGuiNavInput.count] NavInputs;
    bool WantCaptureMouse;
    bool WantCaptureKeyboard;
    bool WantTextInput;
    bool WantSetMousePos;
    bool WantSaveIniSettings;
    bool NavActive;
    bool NavVisible;
    float Framerate;
    int MetricsRenderVertices;
    int MetricsRenderIndices;
    int MetricsRenderWindows;
    int MetricsActiveWindows;
    int MetricsActiveAllocations;
    ImVec2 MouseDelta;
    ImVec2 MousePosPrev;
    ImVec2[5] MouseClickedPos;
    double[5] MouseClickedTime;
    bool[5] MouseClicked;
    bool[5] MouseDoubleClicked;
    bool[5] MouseReleased;
    bool[5] MouseDownOwned;
    float[5] MouseDownDuration;
    float[5] MouseDownDurationPrev;
    ImVec2[5] MouseDragMaxDistanceAbs;
    float[5] MouseDragMaxDistanceSqr;
    float[512] KeysDownDuration;
    float[512] KeysDownDurationPrev;
    float[ImGuiNavInput.count] NavInputsDownDuration;
    float[ImGuiNavInput.count] NavInputsDownDurationPrev;
    ImVector_ImWchar InputQueueCharacters;
}

struct ImGuiInputTextCallbackData
{
    ImGuiInputTextFlags EventFlag;
    ImGuiInputTextFlags Flags;
    void* UserData;
    ImWchar EventChar;
    ImGuiKey EventKey;
    char* Buf;
    int BufTextLen;
    int BufSize;
    bool BufDirty;
    int CursorPos;
    int SelectionStart;
    int SelectionEnd;
}

struct ImGuiSizeCallbackData
{
    void* UserData;
    ImVec2 Pos;
    ImVec2 CurrentSize;
    ImVec2 DesiredSize;
}

struct ImGuiPayload
{
    void* Data;
    int DataSize;
    ImGuiID SourceId;
    ImGuiID SourceParentId;
    int DataFrameCount;
    char[33] DataType;
    bool Preview;
    bool Delivery;
}

struct ImGuiOnceUponAFrame
{
    int RefFrame;
}

struct ImGuiTextFilter
{
    char[256] InputBuf;
    ImVector_TextRange Filters;
    int CountGrep;
}

struct ImGuiTextBuffer
{
    ImVector_char Buf;
}

struct ImGuiStorage
{
    ImVector_Pair Data;
}

struct ImGuiListClipper
{
    float StartPosY;
    float ItemsHeight;
    int ItemsCount;
    int StepNo;
    int DisplayStart;
    int DisplayEnd;
}

struct ImColor
{
    ImVec4 Value;
}

alias ImDrawCallback = void function (const(ImDrawList)* parent_list, const(ImDrawCmd)* cmd);

struct ImDrawCmd
{
    uint ElemCount;
    ImVec4 ClipRect;
    ImTextureID TextureId;
    ImDrawCallback UserCallback;
    void* UserCallbackData;
}

struct ImDrawVert
{
    ImVec2 pos;
    ImVec2 uv;
    ImU32 col;
}

struct ImDrawChannel
{
    ImVector_ImDrawCmd CmdBuffer;
    ImVector_ImDrawIdx IdxBuffer;
}

enum ImDrawCornerFlags
{
    topLeft = 1,
    topRight = 2,
    botLeft = 4,
    botRight = 8,
    top = 3,
    bot = 12,
    left = 5,
    right = 10,
    all = 15
}

enum ImDrawListFlags
{
    none = 0,
    antiAliasedLines = 1,
    antiAliasedFill = 2
}

struct ImDrawList
{
    ImVector_ImDrawCmd CmdBuffer;
    ImVector_ImDrawIdx IdxBuffer;
    ImVector_ImDrawVert VtxBuffer;
    ImDrawListFlags Flags;
    const(ImDrawListSharedData)* _Data;
    const(char)* _OwnerName;
    uint _VtxCurrentIdx;
    ImDrawVert* _VtxWritePtr;
    ImDrawIdx* _IdxWritePtr;
    ImVector_ImVec4 _ClipRectStack;
    ImVector_ImTextureID _TextureIdStack;
    ImVector_ImVec2 _Path;
    int _ChannelsCurrent;
    int _ChannelsCount;
    ImVector_ImDrawChannel _Channels;
}

struct ImDrawData
{
    bool Valid;
    ImDrawList** CmdLists;
    int CmdListsCount;
    int TotalIdxCount;
    int TotalVtxCount;
    ImVec2 DisplayPos;
    ImVec2 DisplaySize;
}

struct ImFontConfig
{
    void* FontData;
    int FontDataSize;
    bool FontDataOwnedByAtlas;
    int FontNo;
    float SizePixels;
    int OversampleH;
    int OversampleV;
    bool PixelSnapH;
    ImVec2 GlyphExtraSpacing;
    ImVec2 GlyphOffset;
    const(ImWchar)* GlyphRanges;
    float GlyphMinAdvanceX;
    float GlyphMaxAdvanceX;
    bool MergeMode;
    uint RasterizerFlags;
    float RasterizerMultiply;
    char[40] Name;
    ImFont* DstFont;
}

struct ImFontGlyph
{
    ImWchar Codepoint;
    float AdvanceX;
    float X0;
    float Y0;
    float X1;
    float Y1;
    float U0;
    float V0;
    float U1;
    float V1;
}

struct ImFontGlyphRangesBuilder
{
    ImVector_int UsedChars;
}

enum ImFontAtlasFlags
{
    none = 0,
    noPowerOfTwoHeight = 1,
    noMouseCursors = 2
}

struct ImFontAtlas
{
    bool Locked;
    ImFontAtlasFlags Flags;
    ImTextureID TexID;
    int TexDesiredWidth;
    int TexGlyphPadding;
    ubyte* TexPixelsAlpha8;
    uint* TexPixelsRGBA32;
    int TexWidth;
    int TexHeight;
    ImVec2 TexUvScale;
    ImVec2 TexUvWhitePixel;
    ImVector_ImFontPtr Fonts;
    ImVector_CustomRect CustomRects;
    ImVector_ImFontConfig ConfigData;
    int[1] CustomRectIds;
}

struct ImFont
{
    float FontSize;
    float Scale;
    ImVec2 DisplayOffset;
    ImVector_ImFontGlyph Glyphs;
    ImVector_float IndexAdvanceX;
    ImVector_ImWchar IndexLookup;
    const(ImFontGlyph)* FallbackGlyph;
    float FallbackAdvanceX;
    ImWchar FallbackChar;
    short ConfigDataCount;
    ImFontConfig* ConfigData;
    ImFontAtlas* ContainerAtlas;
    float Ascent;
    float Descent;
    bool DirtyLookupTables;
    int MetricsTotalSurface;
}

struct CustomRect
{
    uint ID;
    ushort Width;
    ushort Height;
    ushort X;
    ushort Y;
    float GlyphAdvanceX;
    ImVec2 GlyphOffset;
    ImFont* Font;
}

struct TextRange
{
    const(char)* b;
    const(char)* e;
}

struct Pair
{
    ImGuiID key;

    union
    {
        int val_i;
        float val_f;
        void* val_p;
    }
}

extern(C) nothrow ImVec2_Simple ImVec2ToSimple (ImVec2 vec);
extern(C) nothrow ImVec4_Simple ImVec4ToSimple (ImVec4 vec);
extern(C) nothrow ImColor_Simple ImColorToSimple (ImColor col);
extern(C) nothrow ImVec2* ImVec2_ImVec2 ();
extern(C) nothrow void ImVec2_destroy (ImVec2* self);
extern(C) nothrow ImVec2* ImVec2_ImVec2Float (float _x, float _y);
extern(C) nothrow ImVec4* ImVec4_ImVec4 ();
extern(C) nothrow void ImVec4_destroy (ImVec4* self);
extern(C) nothrow ImVec4* ImVec4_ImVec4Float (float _x, float _y, float _z, float _w);
extern(C) nothrow ImGuiContext* igCreateContext (ImFontAtlas* shared_font_atlas);
extern(C) nothrow void igDestroyContext (ImGuiContext* ctx);
extern(C) nothrow ImGuiContext* igGetCurrentContext ();
extern(C) nothrow void igSetCurrentContext (ImGuiContext* ctx);
extern(C) nothrow bool igDebugCheckVersionAndDataLayout (const(char)* version_str, size_t sz_io, size_t sz_style, size_t sz_vec2, size_t sz_vec4, size_t sz_drawvert);
extern(C) nothrow ImGuiIO* igGetIO ();
extern(C) nothrow ImGuiStyle* igGetStyle ();
extern(C) nothrow void igNewFrame ();
extern(C) nothrow void igEndFrame ();
extern(C) nothrow void igRender ();
extern(C) nothrow ImDrawData* igGetDrawData ();
extern(C) nothrow void igShowDemoWindow (bool* p_open);
extern(C) nothrow void igShowAboutWindow (bool* p_open);
extern(C) nothrow void igShowMetricsWindow (bool* p_open);
extern(C) nothrow void igShowStyleEditor (ImGuiStyle* ref_);
extern(C) nothrow bool igShowStyleSelector (const(char)* label);
extern(C) nothrow void igShowFontSelector (const(char)* label);
extern(C) nothrow void igShowUserGuide ();
extern(C) nothrow const(char)* igGetVersion ();
extern(C) nothrow void igStyleColorsDark (ImGuiStyle* dst);
extern(C) nothrow void igStyleColorsClassic (ImGuiStyle* dst);
extern(C) nothrow void igStyleColorsLight (ImGuiStyle* dst);
extern(C) nothrow bool igBegin (const(char)* name, bool* p_open, ImGuiWindowFlags flags);
extern(C) nothrow void igEnd ();
extern(C) nothrow bool igBeginChild (const(char)* str_id, const ImVec2 size, bool border, ImGuiWindowFlags flags);
extern(C) nothrow bool igBeginChildID (ImGuiID id, const ImVec2 size, bool border, ImGuiWindowFlags flags);
extern(C) nothrow void igEndChild ();
extern(C) nothrow bool igIsWindowAppearing ();
extern(C) nothrow bool igIsWindowCollapsed ();
extern(C) nothrow bool igIsWindowFocused (ImGuiFocusedFlags flags);
extern(C) nothrow bool igIsWindowHovered (ImGuiHoveredFlags flags);
extern(C) nothrow ImDrawList* igGetWindowDrawList ();
extern(C) nothrow ImVec2 igGetWindowPos ();
extern(C) nothrow ImVec2 igGetWindowSize ();
extern(C) nothrow float igGetWindowWidth ();
extern(C) nothrow float igGetWindowHeight ();
extern(C) nothrow ImVec2 igGetContentRegionMax ();
extern(C) nothrow ImVec2 igGetContentRegionAvail ();
extern(C) nothrow float igGetContentRegionAvailWidth ();
extern(C) nothrow ImVec2 igGetWindowContentRegionMin ();
extern(C) nothrow ImVec2 igGetWindowContentRegionMax ();
extern(C) nothrow float igGetWindowContentRegionWidth ();
extern(C) nothrow void igSetNextWindowPos (const ImVec2 pos, ImGuiCond cond, const ImVec2 pivot);
extern(C) nothrow void igSetNextWindowSize (const ImVec2 size, ImGuiCond cond);
extern(C) nothrow void igSetNextWindowSizeConstraints (const ImVec2 size_min, const ImVec2 size_max, ImGuiSizeCallback custom_callback, void* custom_callback_data);
extern(C) nothrow void igSetNextWindowContentSize (const ImVec2 size);
extern(C) nothrow void igSetNextWindowCollapsed (bool collapsed, ImGuiCond cond);
extern(C) nothrow void igSetNextWindowFocus ();
extern(C) nothrow void igSetNextWindowBgAlpha (float alpha);
extern(C) nothrow void igSetWindowPosVec2 (const ImVec2 pos, ImGuiCond cond);
extern(C) nothrow void igSetWindowSizeVec2 (const ImVec2 size, ImGuiCond cond);
extern(C) nothrow void igSetWindowCollapsedBool (bool collapsed, ImGuiCond cond);
extern(C) nothrow void igSetWindowFocus ();
extern(C) nothrow void igSetWindowFontScale (float scale);
extern(C) nothrow void igSetWindowPosStr (const(char)* name, const ImVec2 pos, ImGuiCond cond);
extern(C) nothrow void igSetWindowSizeStr (const(char)* name, const ImVec2 size, ImGuiCond cond);
extern(C) nothrow void igSetWindowCollapsedStr (const(char)* name, bool collapsed, ImGuiCond cond);
extern(C) nothrow void igSetWindowFocusStr (const(char)* name);
extern(C) nothrow float igGetScrollX ();
extern(C) nothrow float igGetScrollY ();
extern(C) nothrow float igGetScrollMaxX ();
extern(C) nothrow float igGetScrollMaxY ();
extern(C) nothrow void igSetScrollX (float scroll_x);
extern(C) nothrow void igSetScrollY (float scroll_y);
extern(C) nothrow void igSetScrollHereY (float center_y_ratio);
extern(C) nothrow void igSetScrollFromPosY (float local_y, float center_y_ratio);
extern(C) nothrow void igPushFont (ImFont* font);
extern(C) nothrow void igPopFont ();
extern(C) nothrow void igPushStyleColorU32 (ImGuiCol idx, ImU32 col);
extern(C) nothrow void igPushStyleColor (ImGuiCol idx, const ImVec4 col);
extern(C) nothrow void igPopStyleColor (int count);
extern(C) nothrow void igPushStyleVarFloat (ImGuiStyleVar idx, float val);
extern(C) nothrow void igPushStyleVarVec2 (ImGuiStyleVar idx, const ImVec2 val);
extern(C) nothrow void igPopStyleVar (int count);
extern(C) nothrow const(ImVec4)* igGetStyleColorVec4 (ImGuiCol idx);
extern(C) nothrow ImFont* igGetFont ();
extern(C) nothrow float igGetFontSize ();
extern(C) nothrow ImVec2 igGetFontTexUvWhitePixel ();
extern(C) nothrow ImU32 igGetColorU32 (ImGuiCol idx, float alpha_mul);
extern(C) nothrow ImU32 igGetColorU32Vec4 (const ImVec4 col);
extern(C) nothrow ImU32 igGetColorU32U32 (ImU32 col);
extern(C) nothrow void igPushItemWidth (float item_width);
extern(C) nothrow void igPopItemWidth ();
extern(C) nothrow float igCalcItemWidth ();
extern(C) nothrow void igPushTextWrapPos (float wrap_local_pos_x);
extern(C) nothrow void igPopTextWrapPos ();
extern(C) nothrow void igPushAllowKeyboardFocus (bool allow_keyboard_focus);
extern(C) nothrow void igPopAllowKeyboardFocus ();
extern(C) nothrow void igPushButtonRepeat (bool repeat);
extern(C) nothrow void igPopButtonRepeat ();
extern(C) nothrow void igSeparator ();
extern(C) nothrow void igSameLine (float local_pos_x, float spacing_w);
extern(C) nothrow void igNewLine ();
extern(C) nothrow void igSpacing ();
extern(C) nothrow void igDummy (const ImVec2 size);
extern(C) nothrow void igIndent (float indent_w);
extern(C) nothrow void igUnindent (float indent_w);
extern(C) nothrow void igBeginGroup ();
extern(C) nothrow void igEndGroup ();
extern(C) nothrow ImVec2 igGetCursorPos ();
extern(C) nothrow float igGetCursorPosX ();
extern(C) nothrow float igGetCursorPosY ();
extern(C) nothrow void igSetCursorPos (const ImVec2 local_pos);
extern(C) nothrow void igSetCursorPosX (float local_x);
extern(C) nothrow void igSetCursorPosY (float local_y);
extern(C) nothrow ImVec2 igGetCursorStartPos ();
extern(C) nothrow ImVec2 igGetCursorScreenPos ();
extern(C) nothrow void igSetCursorScreenPos (const ImVec2 pos);
extern(C) nothrow void igAlignTextToFramePadding ();
extern(C) nothrow float igGetTextLineHeight ();
extern(C) nothrow float igGetTextLineHeightWithSpacing ();
extern(C) nothrow float igGetFrameHeight ();
extern(C) nothrow float igGetFrameHeightWithSpacing ();
extern(C) nothrow void igPushIDStr (const(char)* str_id);
extern(C) nothrow void igPushIDRange (const(char)* str_id_begin, const(char)* str_id_end);
extern(C) nothrow void igPushIDPtr (const(void)* ptr_id);
extern(C) nothrow void igPushIDInt (int int_id);
extern(C) nothrow void igPopID ();
extern(C) nothrow ImGuiID igGetIDStr (const(char)* str_id);
extern(C) nothrow ImGuiID igGetIDRange (const(char)* str_id_begin, const(char)* str_id_end);
extern(C) nothrow ImGuiID igGetIDPtr (const(void)* ptr_id);
extern(C) nothrow void igTextUnformatted (const(char)* text, const(char)* text_end);
extern(C) nothrow void igText (const(char)* fmt, ...);
extern(C) nothrow void igTextV (const(char)* fmt, va_list args);
extern(C) nothrow void igTextColored (const ImVec4 col, const(char)* fmt, ...);
extern(C) nothrow void igTextColoredV (const ImVec4 col, const(char)* fmt, va_list args);
extern(C) nothrow void igTextDisabled (const(char)* fmt, ...);
extern(C) nothrow void igTextDisabledV (const(char)* fmt, va_list args);
extern(C) nothrow void igTextWrapped (const(char)* fmt, ...);
extern(C) nothrow void igTextWrappedV (const(char)* fmt, va_list args);
extern(C) nothrow void igLabelText (const(char)* label, const(char)* fmt, ...);
extern(C) nothrow void igLabelTextV (const(char)* label, const(char)* fmt, va_list args);
extern(C) nothrow void igBulletText (const(char)* fmt, ...);
extern(C) nothrow void igBulletTextV (const(char)* fmt, va_list args);
extern(C) nothrow bool igButton (const(char)* label, const ImVec2 size);
extern(C) nothrow bool igSmallButton (const(char)* label);
extern(C) nothrow bool igInvisibleButton (const(char)* str_id, const ImVec2 size);
extern(C) nothrow bool igArrowButton (const(char)* str_id, ImGuiDir dir);
extern(C) nothrow void igImage (ImTextureID user_texture_id, const ImVec2 size, const ImVec2 uv0, const ImVec2 uv1, const ImVec4 tint_col, const ImVec4 border_col);
extern(C) nothrow bool igImageButton (ImTextureID user_texture_id, const ImVec2 size, const ImVec2 uv0, const ImVec2 uv1, int frame_padding, const ImVec4 bg_col, const ImVec4 tint_col);
extern(C) nothrow bool igCheckbox (const(char)* label, bool* v);
extern(C) nothrow bool igCheckboxFlags (const(char)* label, uint* flags, uint flags_value);
extern(C) nothrow bool igRadioButtonBool (const(char)* label, bool active);
extern(C) nothrow bool igRadioButtonIntPtr (const(char)* label, int* v, int v_button);
extern(C) nothrow void igProgressBar (float fraction, const ImVec2 size_arg, const(char)* overlay);
extern(C) nothrow void igBullet ();
extern(C) nothrow bool igBeginCombo (const(char)* label, const(char)* preview_value, ImGuiComboFlags flags);
extern(C) nothrow void igEndCombo ();
extern(C) nothrow bool igCombo (const(char)* label, int* current_item, const(char*)* items, int items_count, int popup_max_height_in_items);
extern(C) nothrow bool igComboStr (const(char)* label, int* current_item, const(char)* items_separated_by_zeros, int popup_max_height_in_items);
extern(C) nothrow bool igComboFnPtr (const(char)* label, int* current_item, bool function (void* data, int idx, const(char*)* out_text) items_getter, void* data, int items_count, int popup_max_height_in_items);
extern(C) nothrow bool igDragFloat (const(char)* label, float* v, float v_speed, float v_min, float v_max, const(char)* format, float power);
extern(C) nothrow bool igDragFloat2 (const(char)* label, ref float[2] v, float v_speed, float v_min, float v_max, const(char)* format, float power);
extern(C) nothrow bool igDragFloat3 (const(char)* label, ref float[3] v, float v_speed, float v_min, float v_max, const(char)* format, float power);
extern(C) nothrow bool igDragFloat4 (const(char)* label, ref float[4] v, float v_speed, float v_min, float v_max, const(char)* format, float power);
extern(C) nothrow bool igDragFloatRange2 (const(char)* label, float* v_current_min, float* v_current_max, float v_speed, float v_min, float v_max, const(char)* format, const(char)* format_max, float power);
extern(C) nothrow bool igDragInt (const(char)* label, int* v, float v_speed, int v_min, int v_max, const(char)* format);
extern(C) nothrow bool igDragInt2 (const(char)* label, ref int[2] v, float v_speed, int v_min, int v_max, const(char)* format);
extern(C) nothrow bool igDragInt3 (const(char)* label, ref int[3] v, float v_speed, int v_min, int v_max, const(char)* format);
extern(C) nothrow bool igDragInt4 (const(char)* label, ref int[4] v, float v_speed, int v_min, int v_max, const(char)* format);
extern(C) nothrow bool igDragIntRange2 (const(char)* label, int* v_current_min, int* v_current_max, float v_speed, int v_min, int v_max, const(char)* format, const(char)* format_max);
extern(C) nothrow bool igDragScalar (const(char)* label, ImGuiDataType data_type, void* v, float v_speed, const(void)* v_min, const(void)* v_max, const(char)* format, float power);
extern(C) nothrow bool igDragScalarN (const(char)* label, ImGuiDataType data_type, void* v, int components, float v_speed, const(void)* v_min, const(void)* v_max, const(char)* format, float power);
extern(C) nothrow bool igSliderFloat (const(char)* label, float* v, float v_min, float v_max, const(char)* format, float power);
extern(C) nothrow bool igSliderFloat2 (const(char)* label, ref float[2] v, float v_min, float v_max, const(char)* format, float power);
extern(C) nothrow bool igSliderFloat3 (const(char)* label, ref float[3] v, float v_min, float v_max, const(char)* format, float power);
extern(C) nothrow bool igSliderFloat4 (const(char)* label, ref float[4] v, float v_min, float v_max, const(char)* format, float power);
extern(C) nothrow bool igSliderAngle (const(char)* label, float* v_rad, float v_degrees_min, float v_degrees_max, const(char)* format);
extern(C) nothrow bool igSliderInt (const(char)* label, int* v, int v_min, int v_max, const(char)* format);
extern(C) nothrow bool igSliderInt2 (const(char)* label, ref int[2] v, int v_min, int v_max, const(char)* format);
extern(C) nothrow bool igSliderInt3 (const(char)* label, ref int[3] v, int v_min, int v_max, const(char)* format);
extern(C) nothrow bool igSliderInt4 (const(char)* label, ref int[4] v, int v_min, int v_max, const(char)* format);
extern(C) nothrow bool igSliderScalar (const(char)* label, ImGuiDataType data_type, void* v, const(void)* v_min, const(void)* v_max, const(char)* format, float power);
extern(C) nothrow bool igSliderScalarN (const(char)* label, ImGuiDataType data_type, void* v, int components, const(void)* v_min, const(void)* v_max, const(char)* format, float power);
extern(C) nothrow bool igVSliderFloat (const(char)* label, const ImVec2 size, float* v, float v_min, float v_max, const(char)* format, float power);
extern(C) nothrow bool igVSliderInt (const(char)* label, const ImVec2 size, int* v, int v_min, int v_max, const(char)* format);
extern(C) nothrow bool igVSliderScalar (const(char)* label, const ImVec2 size, ImGuiDataType data_type, void* v, const(void)* v_min, const(void)* v_max, const(char)* format, float power);
extern(C) nothrow bool igInputText (const(char)* label, char* buf, size_t buf_size, ImGuiInputTextFlags flags, ImGuiInputTextCallback callback, void* user_data);
extern(C) nothrow bool igInputTextMultiline (const(char)* label, char* buf, size_t buf_size, const ImVec2 size, ImGuiInputTextFlags flags, ImGuiInputTextCallback callback, void* user_data);
extern(C) nothrow bool igInputFloat (const(char)* label, float* v, float step, float step_fast, const(char)* format, ImGuiInputTextFlags flags);
extern(C) nothrow bool igInputFloat2 (const(char)* label, ref float[2] v, const(char)* format, ImGuiInputTextFlags flags);
extern(C) nothrow bool igInputFloat3 (const(char)* label, ref float[3] v, const(char)* format, ImGuiInputTextFlags flags);
extern(C) nothrow bool igInputFloat4 (const(char)* label, ref float[4] v, const(char)* format, ImGuiInputTextFlags flags);
extern(C) nothrow bool igInputInt (const(char)* label, int* v, int step, int step_fast, ImGuiInputTextFlags flags);
extern(C) nothrow bool igInputInt2 (const(char)* label, ref int[2] v, ImGuiInputTextFlags flags);
extern(C) nothrow bool igInputInt3 (const(char)* label, ref int[3] v, ImGuiInputTextFlags flags);
extern(C) nothrow bool igInputInt4 (const(char)* label, ref int[4] v, ImGuiInputTextFlags flags);
extern(C) nothrow bool igInputDouble (const(char)* label, double* v, double step, double step_fast, const(char)* format, ImGuiInputTextFlags flags);
extern(C) nothrow bool igInputScalar (const(char)* label, ImGuiDataType data_type, void* v, const(void)* step, const(void)* step_fast, const(char)* format, ImGuiInputTextFlags flags);
extern(C) nothrow bool igInputScalarN (const(char)* label, ImGuiDataType data_type, void* v, int components, const(void)* step, const(void)* step_fast, const(char)* format, ImGuiInputTextFlags flags);
extern(C) nothrow bool igColorEdit3 (const(char)* label, ref float[3] col, ImGuiColorEditFlags flags);
extern(C) nothrow bool igColorEdit4 (const(char)* label, ref float[4] col, ImGuiColorEditFlags flags);
extern(C) nothrow bool igColorPicker3 (const(char)* label, ref float[3] col, ImGuiColorEditFlags flags);
extern(C) nothrow bool igColorPicker4 (const(char)* label, ref float[4] col, ImGuiColorEditFlags flags, const(float)* ref_col);
extern(C) nothrow bool igColorButton (const(char)* desc_id, const ImVec4 col, ImGuiColorEditFlags flags, ImVec2 size);
extern(C) nothrow void igSetColorEditOptions (ImGuiColorEditFlags flags);
extern(C) nothrow bool igTreeNodeStr (const(char)* label);
extern(C) nothrow bool igTreeNodeStrStr (const(char)* str_id, const(char)* fmt, ...);
extern(C) nothrow bool igTreeNodePtr (const(void)* ptr_id, const(char)* fmt, ...);
extern(C) nothrow bool igTreeNodeVStr (const(char)* str_id, const(char)* fmt, va_list args);
extern(C) nothrow bool igTreeNodeVPtr (const(void)* ptr_id, const(char)* fmt, va_list args);
extern(C) nothrow bool igTreeNodeExStr (const(char)* label, ImGuiTreeNodeFlags flags);
extern(C) nothrow bool igTreeNodeExStrStr (const(char)* str_id, ImGuiTreeNodeFlags flags, const(char)* fmt, ...);
extern(C) nothrow bool igTreeNodeExPtr (const(void)* ptr_id, ImGuiTreeNodeFlags flags, const(char)* fmt, ...);
extern(C) nothrow bool igTreeNodeExVStr (const(char)* str_id, ImGuiTreeNodeFlags flags, const(char)* fmt, va_list args);
extern(C) nothrow bool igTreeNodeExVPtr (const(void)* ptr_id, ImGuiTreeNodeFlags flags, const(char)* fmt, va_list args);
extern(C) nothrow void igTreePushStr (const(char)* str_id);
extern(C) nothrow void igTreePushPtr (const(void)* ptr_id);
extern(C) nothrow void igTreePop ();
extern(C) nothrow void igTreeAdvanceToLabelPos ();
extern(C) nothrow float igGetTreeNodeToLabelSpacing ();
extern(C) nothrow void igSetNextTreeNodeOpen (bool is_open, ImGuiCond cond);
extern(C) nothrow bool igCollapsingHeader (const(char)* label, ImGuiTreeNodeFlags flags);
extern(C) nothrow bool igCollapsingHeaderBoolPtr (const(char)* label, bool* p_open, ImGuiTreeNodeFlags flags);
extern(C) nothrow bool igSelectable (const(char)* label, bool selected, ImGuiSelectableFlags flags, const ImVec2 size);
extern(C) nothrow bool igSelectableBoolPtr (const(char)* label, bool* p_selected, ImGuiSelectableFlags flags, const ImVec2 size);
extern(C) nothrow bool igListBoxStr_arr (const(char)* label, int* current_item, const(char*)* items, int items_count, int height_in_items);
extern(C) nothrow bool igListBoxFnPtr (const(char)* label, int* current_item, bool function (void* data, int idx, const(char*)* out_text) items_getter, void* data, int items_count, int height_in_items);
extern(C) nothrow bool igListBoxHeaderVec2 (const(char)* label, const ImVec2 size);
extern(C) nothrow bool igListBoxHeaderInt (const(char)* label, int items_count, int height_in_items);
extern(C) nothrow void igListBoxFooter ();
extern(C) nothrow void igPlotLines (const(char)* label, const(float)* values, int values_count, int values_offset, const(char)* overlay_text, float scale_min, float scale_max, ImVec2 graph_size, int stride);
extern(C) nothrow void igPlotLinesFnPtr (const(char)* label, float function (void* data, int idx) values_getter, void* data, int values_count, int values_offset, const(char)* overlay_text, float scale_min, float scale_max, ImVec2 graph_size);
extern(C) nothrow void igPlotHistogramFloatPtr (const(char)* label, const(float)* values, int values_count, int values_offset, const(char)* overlay_text, float scale_min, float scale_max, ImVec2 graph_size, int stride);
extern(C) nothrow void igPlotHistogramFnPtr (const(char)* label, float function (void* data, int idx) values_getter, void* data, int values_count, int values_offset, const(char)* overlay_text, float scale_min, float scale_max, ImVec2 graph_size);
extern(C) nothrow void igValueBool (const(char)* prefix, bool b);
extern(C) nothrow void igValueInt (const(char)* prefix, int v);
extern(C) nothrow void igValueUint (const(char)* prefix, uint v);
extern(C) nothrow void igValueFloat (const(char)* prefix, float v, const(char)* float_format);
extern(C) nothrow bool igBeginMainMenuBar ();
extern(C) nothrow void igEndMainMenuBar ();
extern(C) nothrow bool igBeginMenuBar ();
extern(C) nothrow void igEndMenuBar ();
extern(C) nothrow bool igBeginMenu (const(char)* label, bool enabled);
extern(C) nothrow void igEndMenu ();
extern(C) nothrow bool igMenuItemBool (const(char)* label, const(char)* shortcut, bool selected, bool enabled);
extern(C) nothrow bool igMenuItemBoolPtr (const(char)* label, const(char)* shortcut, bool* p_selected, bool enabled);
extern(C) nothrow void igBeginTooltip ();
extern(C) nothrow void igEndTooltip ();
extern(C) nothrow void igSetTooltip (const(char)* fmt, ...);
extern(C) nothrow void igSetTooltipV (const(char)* fmt, va_list args);
extern(C) nothrow void igOpenPopup (const(char)* str_id);
extern(C) nothrow bool igBeginPopup (const(char)* str_id, ImGuiWindowFlags flags);
extern(C) nothrow bool igBeginPopupContextItem (const(char)* str_id, int mouse_button);
extern(C) nothrow bool igBeginPopupContextWindow (const(char)* str_id, int mouse_button, bool also_over_items);
extern(C) nothrow bool igBeginPopupContextVoid (const(char)* str_id, int mouse_button);
extern(C) nothrow bool igBeginPopupModal (const(char)* name, bool* p_open, ImGuiWindowFlags flags);
extern(C) nothrow void igEndPopup ();
extern(C) nothrow bool igOpenPopupOnItemClick (const(char)* str_id, int mouse_button);
extern(C) nothrow bool igIsPopupOpen (const(char)* str_id);
extern(C) nothrow void igCloseCurrentPopup ();
extern(C) nothrow void igColumns (int count, const(char)* id, bool border);
extern(C) nothrow void igNextColumn ();
extern(C) nothrow int igGetColumnIndex ();
extern(C) nothrow float igGetColumnWidth (int column_index);
extern(C) nothrow void igSetColumnWidth (int column_index, float width);
extern(C) nothrow float igGetColumnOffset (int column_index);
extern(C) nothrow void igSetColumnOffset (int column_index, float offset_x);
extern(C) nothrow int igGetColumnsCount ();
extern(C) nothrow bool igBeginTabBar (const(char)* str_id, ImGuiTabBarFlags flags);
extern(C) nothrow void igEndTabBar ();
extern(C) nothrow bool igBeginTabItem (const(char)* label, bool* p_open, ImGuiTabItemFlags flags);
extern(C) nothrow void igEndTabItem ();
extern(C) nothrow void igSetTabItemClosed (const(char)* tab_or_docked_window_label);
extern(C) nothrow void igLogToTTY (int max_depth);
extern(C) nothrow void igLogToFile (int max_depth, const(char)* filename);
extern(C) nothrow void igLogToClipboard (int max_depth);
extern(C) nothrow void igLogFinish ();
extern(C) nothrow void igLogButtons ();
extern(C) nothrow bool igBeginDragDropSource (ImGuiDragDropFlags flags);
extern(C) nothrow bool igSetDragDropPayload (const(char)* type, const(void)* data, size_t size, ImGuiCond cond);
extern(C) nothrow void igEndDragDropSource ();
extern(C) nothrow bool igBeginDragDropTarget ();
extern(C) nothrow const(ImGuiPayload)* igAcceptDragDropPayload (const(char)* type, ImGuiDragDropFlags flags);
extern(C) nothrow void igEndDragDropTarget ();
extern(C) nothrow const(ImGuiPayload)* igGetDragDropPayload ();
extern(C) nothrow void igPushClipRect (const ImVec2 clip_rect_min, const ImVec2 clip_rect_max, bool intersect_with_current_clip_rect);
extern(C) nothrow void igPopClipRect ();
extern(C) nothrow void igSetItemDefaultFocus ();
extern(C) nothrow void igSetKeyboardFocusHere (int offset);
extern(C) nothrow bool igIsItemHovered (ImGuiHoveredFlags flags);
extern(C) nothrow bool igIsItemActive ();
extern(C) nothrow bool igIsItemFocused ();
extern(C) nothrow bool igIsItemClicked (int mouse_button);
extern(C) nothrow bool igIsItemVisible ();
extern(C) nothrow bool igIsItemEdited ();
extern(C) nothrow bool igIsItemDeactivated ();
extern(C) nothrow bool igIsItemDeactivatedAfterEdit ();
extern(C) nothrow bool igIsAnyItemHovered ();
extern(C) nothrow bool igIsAnyItemActive ();
extern(C) nothrow bool igIsAnyItemFocused ();
extern(C) nothrow ImVec2 igGetItemRectMin ();
extern(C) nothrow ImVec2 igGetItemRectMax ();
extern(C) nothrow ImVec2 igGetItemRectSize ();
extern(C) nothrow void igSetItemAllowOverlap ();
extern(C) nothrow bool igIsRectVisible (const ImVec2 size);
extern(C) nothrow bool igIsRectVisibleVec2 (const ImVec2 rect_min, const ImVec2 rect_max);
extern(C) nothrow double igGetTime ();
extern(C) nothrow int igGetFrameCount ();
extern(C) nothrow ImDrawList* igGetOverlayDrawList ();
extern(C) nothrow ImDrawListSharedData* igGetDrawListSharedData ();
extern(C) nothrow const(char)* igGetStyleColorName (ImGuiCol idx);
extern(C) nothrow void igSetStateStorage (ImGuiStorage* storage);
extern(C) nothrow ImGuiStorage* igGetStateStorage ();
extern(C) nothrow ImVec2 igCalcTextSize (const(char)* text, const(char)* text_end, bool hide_text_after_double_hash, float wrap_width);
extern(C) nothrow void igCalcListClipping (int items_count, float items_height, int* out_items_display_start, int* out_items_display_end);
extern(C) nothrow bool igBeginChildFrame (ImGuiID id, const ImVec2 size, ImGuiWindowFlags flags);
extern(C) nothrow void igEndChildFrame ();
extern(C) nothrow ImVec4 igColorConvertU32ToFloat4 (ImU32 in_);
extern(C) nothrow ImU32 igColorConvertFloat4ToU32 (const ImVec4 in_);
extern(C) nothrow int igGetKeyIndex (ImGuiKey imgui_key);
extern(C) nothrow bool igIsKeyDown (int user_key_index);
extern(C) nothrow bool igIsKeyPressed (int user_key_index, bool repeat);
extern(C) nothrow bool igIsKeyReleased (int user_key_index);
extern(C) nothrow int igGetKeyPressedAmount (int key_index, float repeat_delay, float rate);
extern(C) nothrow bool igIsMouseDown (int button);
extern(C) nothrow bool igIsAnyMouseDown ();
extern(C) nothrow bool igIsMouseClicked (int button, bool repeat);
extern(C) nothrow bool igIsMouseDoubleClicked (int button);
extern(C) nothrow bool igIsMouseReleased (int button);
extern(C) nothrow bool igIsMouseDragging (int button, float lock_threshold);
extern(C) nothrow bool igIsMouseHoveringRect (const ImVec2 r_min, const ImVec2 r_max, bool clip);
extern(C) nothrow bool igIsMousePosValid (const(ImVec2)* mouse_pos);
extern(C) nothrow ImVec2 igGetMousePos ();
extern(C) nothrow ImVec2 igGetMousePosOnOpeningCurrentPopup ();
extern(C) nothrow ImVec2 igGetMouseDragDelta (int button, float lock_threshold);
extern(C) nothrow void igResetMouseDragDelta (int button);
extern(C) nothrow ImGuiMouseCursor igGetMouseCursor ();
extern(C) nothrow void igSetMouseCursor (ImGuiMouseCursor type);
extern(C) nothrow void igCaptureKeyboardFromApp (bool want_capture_keyboard_value);
extern(C) nothrow void igCaptureMouseFromApp (bool want_capture_mouse_value);
extern(C) nothrow const(char)* igGetClipboardText ();
extern(C) nothrow void igSetClipboardText (const(char)* text);
extern(C) nothrow void igLoadIniSettingsFromDisk (const(char)* ini_filename);
extern(C) nothrow void igLoadIniSettingsFromMemory (const(char)* ini_data, size_t ini_size);
extern(C) nothrow void igSaveIniSettingsToDisk (const(char)* ini_filename);
extern(C) nothrow const(char)* igSaveIniSettingsToMemory (size_t* out_ini_size);
extern(C) nothrow void igSetAllocatorFunctions (void* function (size_t sz, void* user_data) alloc_func, void function (void* ptr, void* user_data) free_func, void* user_data);
extern(C) nothrow void* igMemAlloc (size_t size);
extern(C) nothrow void igMemFree (void* ptr);
extern(C) nothrow ImGuiStyle* ImGuiStyle_ImGuiStyle ();
extern(C) nothrow void ImGuiStyle_destroy (ImGuiStyle* self);
extern(C) nothrow void ImGuiStyle_ScaleAllSizes (ImGuiStyle* self, float scale_factor);
extern(C) nothrow void ImGuiIO_AddInputCharacter (ImGuiIO* self, ImWchar c);
extern(C) nothrow void ImGuiIO_AddInputCharactersUTF8 (ImGuiIO* self, const(char)* str);
extern(C) nothrow void ImGuiIO_ClearInputCharacters (ImGuiIO* self);
extern(C) nothrow ImGuiIO* ImGuiIO_ImGuiIO ();
extern(C) nothrow void ImGuiIO_destroy (ImGuiIO* self);
extern(C) nothrow ImGuiInputTextCallbackData* ImGuiInputTextCallbackData_ImGuiInputTextCallbackData ();
extern(C) nothrow void ImGuiInputTextCallbackData_destroy (ImGuiInputTextCallbackData* self);
extern(C) nothrow void ImGuiInputTextCallbackData_DeleteChars (ImGuiInputTextCallbackData* self, int pos, int bytes_count);
extern(C) nothrow void ImGuiInputTextCallbackData_InsertChars (ImGuiInputTextCallbackData* self, int pos, const(char)* text, const(char)* text_end);
extern(C) nothrow bool ImGuiInputTextCallbackData_HasSelection (ImGuiInputTextCallbackData* self);
extern(C) nothrow ImGuiPayload* ImGuiPayload_ImGuiPayload ();
extern(C) nothrow void ImGuiPayload_destroy (ImGuiPayload* self);
extern(C) nothrow void ImGuiPayload_Clear (ImGuiPayload* self);
extern(C) nothrow bool ImGuiPayload_IsDataType (ImGuiPayload* self, const(char)* type);
extern(C) nothrow bool ImGuiPayload_IsPreview (ImGuiPayload* self);
extern(C) nothrow bool ImGuiPayload_IsDelivery (ImGuiPayload* self);
extern(C) nothrow ImGuiOnceUponAFrame* ImGuiOnceUponAFrame_ImGuiOnceUponAFrame ();
extern(C) nothrow void ImGuiOnceUponAFrame_destroy (ImGuiOnceUponAFrame* self);
extern(C) nothrow ImGuiTextFilter* ImGuiTextFilter_ImGuiTextFilter (const(char)* default_filter);
extern(C) nothrow void ImGuiTextFilter_destroy (ImGuiTextFilter* self);
extern(C) nothrow bool ImGuiTextFilter_Draw (ImGuiTextFilter* self, const(char)* label, float width);
extern(C) nothrow bool ImGuiTextFilter_PassFilter (ImGuiTextFilter* self, const(char)* text, const(char)* text_end);
extern(C) nothrow void ImGuiTextFilter_Build (ImGuiTextFilter* self);
extern(C) nothrow void ImGuiTextFilter_Clear (ImGuiTextFilter* self);
extern(C) nothrow bool ImGuiTextFilter_IsActive (ImGuiTextFilter* self);
extern(C) nothrow TextRange* TextRange_TextRange ();
extern(C) nothrow void TextRange_destroy (TextRange* self);
extern(C) nothrow TextRange* TextRange_TextRangeStr (const(char)* _b, const(char)* _e);
extern(C) nothrow const(char)* TextRange_begin (TextRange* self);
extern(C) nothrow const(char)* TextRange_end (TextRange* self);
extern(C) nothrow bool TextRange_empty (TextRange* self);
extern(C) nothrow void TextRange_split (TextRange* self, char separator, ImVector_TextRange* out_);
extern(C) nothrow ImGuiTextBuffer* ImGuiTextBuffer_ImGuiTextBuffer ();
extern(C) nothrow void ImGuiTextBuffer_destroy (ImGuiTextBuffer* self);
extern(C) nothrow const(char)* ImGuiTextBuffer_begin (ImGuiTextBuffer* self);
extern(C) nothrow const(char)* ImGuiTextBuffer_end (ImGuiTextBuffer* self);
extern(C) nothrow int ImGuiTextBuffer_size (ImGuiTextBuffer* self);
extern(C) nothrow bool ImGuiTextBuffer_empty (ImGuiTextBuffer* self);
extern(C) nothrow void ImGuiTextBuffer_clear (ImGuiTextBuffer* self);
extern(C) nothrow void ImGuiTextBuffer_reserve (ImGuiTextBuffer* self, int capacity);
extern(C) nothrow const(char)* ImGuiTextBuffer_c_str (ImGuiTextBuffer* self);
extern(C) nothrow void ImGuiTextBuffer_appendfv (ImGuiTextBuffer* self, const(char)* fmt, va_list args);
extern(C) nothrow Pair* Pair_PairInt (ImGuiID _key, int _val_i);
extern(C) nothrow void Pair_destroy (Pair* self);
extern(C) nothrow Pair* Pair_PairFloat (ImGuiID _key, float _val_f);
extern(C) nothrow Pair* Pair_PairPtr (ImGuiID _key, void* _val_p);
extern(C) nothrow void ImGuiStorage_Clear (ImGuiStorage* self);
extern(C) nothrow int ImGuiStorage_GetInt (ImGuiStorage* self, ImGuiID key, int default_val);
extern(C) nothrow void ImGuiStorage_SetInt (ImGuiStorage* self, ImGuiID key, int val);
extern(C) nothrow bool ImGuiStorage_GetBool (ImGuiStorage* self, ImGuiID key, bool default_val);
extern(C) nothrow void ImGuiStorage_SetBool (ImGuiStorage* self, ImGuiID key, bool val);
extern(C) nothrow float ImGuiStorage_GetFloat (ImGuiStorage* self, ImGuiID key, float default_val);
extern(C) nothrow void ImGuiStorage_SetFloat (ImGuiStorage* self, ImGuiID key, float val);
extern(C) nothrow void* ImGuiStorage_GetVoidPtr (ImGuiStorage* self, ImGuiID key);
extern(C) nothrow void ImGuiStorage_SetVoidPtr (ImGuiStorage* self, ImGuiID key, void* val);
extern(C) nothrow int* ImGuiStorage_GetIntRef (ImGuiStorage* self, ImGuiID key, int default_val);
extern(C) nothrow bool* ImGuiStorage_GetBoolRef (ImGuiStorage* self, ImGuiID key, bool default_val);
extern(C) nothrow float* ImGuiStorage_GetFloatRef (ImGuiStorage* self, ImGuiID key, float default_val);
extern(C) nothrow void** ImGuiStorage_GetVoidPtrRef (ImGuiStorage* self, ImGuiID key, void* default_val);
extern(C) nothrow void ImGuiStorage_SetAllInt (ImGuiStorage* self, int val);
extern(C) nothrow void ImGuiStorage_BuildSortByKey (ImGuiStorage* self);
extern(C) nothrow ImGuiListClipper* ImGuiListClipper_ImGuiListClipper (int items_count, float items_height);
extern(C) nothrow void ImGuiListClipper_destroy (ImGuiListClipper* self);
extern(C) nothrow bool ImGuiListClipper_Step (ImGuiListClipper* self);
extern(C) nothrow void ImGuiListClipper_Begin (ImGuiListClipper* self, int items_count, float items_height);
extern(C) nothrow void ImGuiListClipper_End (ImGuiListClipper* self);
extern(C) nothrow ImColor* ImColor_ImColor ();
extern(C) nothrow void ImColor_destroy (ImColor* self);
extern(C) nothrow ImColor* ImColor_ImColorInt (int r, int g, int b, int a);
extern(C) nothrow ImColor* ImColor_ImColorU32 (ImU32 rgba);
extern(C) nothrow ImColor* ImColor_ImColorFloat (float r, float g, float b, float a);
extern(C) nothrow ImColor* ImColor_ImColorVec4 (const ImVec4 col);
extern(C) nothrow void ImColor_SetHSV (ImColor* self, float h, float s, float v, float a);
extern(C) nothrow ImColor ImColor_HSV (ImColor* self, float h, float s, float v, float a);
extern(C) nothrow ImDrawCmd* ImDrawCmd_ImDrawCmd ();
extern(C) nothrow void ImDrawCmd_destroy (ImDrawCmd* self);
extern(C) nothrow ImDrawList* ImDrawList_ImDrawList (const(ImDrawListSharedData)* shared_data);
extern(C) nothrow void ImDrawList_destroy (ImDrawList* self);
extern(C) nothrow void ImDrawList_PushClipRect (ImDrawList* self, ImVec2 clip_rect_min, ImVec2 clip_rect_max, bool intersect_with_current_clip_rect);
extern(C) nothrow void ImDrawList_PushClipRectFullScreen (ImDrawList* self);
extern(C) nothrow void ImDrawList_PopClipRect (ImDrawList* self);
extern(C) nothrow void ImDrawList_PushTextureID (ImDrawList* self, ImTextureID texture_id);
extern(C) nothrow void ImDrawList_PopTextureID (ImDrawList* self);
extern(C) nothrow ImVec2 ImDrawList_GetClipRectMin (ImDrawList* self);
extern(C) nothrow ImVec2 ImDrawList_GetClipRectMax (ImDrawList* self);
extern(C) nothrow void ImDrawList_AddLine (ImDrawList* self, const ImVec2 a, const ImVec2 b, ImU32 col, float thickness);
extern(C) nothrow void ImDrawList_AddRect (ImDrawList* self, const ImVec2 a, const ImVec2 b, ImU32 col, float rounding, int rounding_corners_flags, float thickness);
extern(C) nothrow void ImDrawList_AddRectFilled (ImDrawList* self, const ImVec2 a, const ImVec2 b, ImU32 col, float rounding, int rounding_corners_flags);
extern(C) nothrow void ImDrawList_AddRectFilledMultiColor (ImDrawList* self, const ImVec2 a, const ImVec2 b, ImU32 col_upr_left, ImU32 col_upr_right, ImU32 col_bot_right, ImU32 col_bot_left);
extern(C) nothrow void ImDrawList_AddQuad (ImDrawList* self, const ImVec2 a, const ImVec2 b, const ImVec2 c, const ImVec2 d, ImU32 col, float thickness);
extern(C) nothrow void ImDrawList_AddQuadFilled (ImDrawList* self, const ImVec2 a, const ImVec2 b, const ImVec2 c, const ImVec2 d, ImU32 col);
extern(C) nothrow void ImDrawList_AddTriangle (ImDrawList* self, const ImVec2 a, const ImVec2 b, const ImVec2 c, ImU32 col, float thickness);
extern(C) nothrow void ImDrawList_AddTriangleFilled (ImDrawList* self, const ImVec2 a, const ImVec2 b, const ImVec2 c, ImU32 col);
extern(C) nothrow void ImDrawList_AddCircle (ImDrawList* self, const ImVec2 centre, float radius, ImU32 col, int num_segments, float thickness);
extern(C) nothrow void ImDrawList_AddCircleFilled (ImDrawList* self, const ImVec2 centre, float radius, ImU32 col, int num_segments);
extern(C) nothrow void ImDrawList_AddText (ImDrawList* self, const ImVec2 pos, ImU32 col, const(char)* text_begin, const(char)* text_end);
extern(C) nothrow void ImDrawList_AddTextFontPtr (ImDrawList* self, const(ImFont)* font, float font_size, const ImVec2 pos, ImU32 col, const(char)* text_begin, const(char)* text_end, float wrap_width, const(ImVec4)* cpu_fine_clip_rect);
extern(C) nothrow void ImDrawList_AddImage (ImDrawList* self, ImTextureID user_texture_id, const ImVec2 a, const ImVec2 b, const ImVec2 uv_a, const ImVec2 uv_b, ImU32 col);
extern(C) nothrow void ImDrawList_AddImageQuad (ImDrawList* self, ImTextureID user_texture_id, const ImVec2 a, const ImVec2 b, const ImVec2 c, const ImVec2 d, const ImVec2 uv_a, const ImVec2 uv_b, const ImVec2 uv_c, const ImVec2 uv_d, ImU32 col);
extern(C) nothrow void ImDrawList_AddImageRounded (ImDrawList* self, ImTextureID user_texture_id, const ImVec2 a, const ImVec2 b, const ImVec2 uv_a, const ImVec2 uv_b, ImU32 col, float rounding, int rounding_corners);
extern(C) nothrow void ImDrawList_AddPolyline (ImDrawList* self, const(ImVec2)* points, const int num_points, ImU32 col, bool closed, float thickness);
extern(C) nothrow void ImDrawList_AddConvexPolyFilled (ImDrawList* self, const(ImVec2)* points, const int num_points, ImU32 col);
extern(C) nothrow void ImDrawList_AddBezierCurve (ImDrawList* self, const ImVec2 pos0, const ImVec2 cp0, const ImVec2 cp1, const ImVec2 pos1, ImU32 col, float thickness, int num_segments);
extern(C) nothrow void ImDrawList_PathClear (ImDrawList* self);
extern(C) nothrow void ImDrawList_PathLineTo (ImDrawList* self, const ImVec2 pos);
extern(C) nothrow void ImDrawList_PathLineToMergeDuplicate (ImDrawList* self, const ImVec2 pos);
extern(C) nothrow void ImDrawList_PathFillConvex (ImDrawList* self, ImU32 col);
extern(C) nothrow void ImDrawList_PathStroke (ImDrawList* self, ImU32 col, bool closed, float thickness);
extern(C) nothrow void ImDrawList_PathArcTo (ImDrawList* self, const ImVec2 centre, float radius, float a_min, float a_max, int num_segments);
extern(C) nothrow void ImDrawList_PathArcToFast (ImDrawList* self, const ImVec2 centre, float radius, int a_min_of_12, int a_max_of_12);
extern(C) nothrow void ImDrawList_PathBezierCurveTo (ImDrawList* self, const ImVec2 p1, const ImVec2 p2, const ImVec2 p3, int num_segments);
extern(C) nothrow void ImDrawList_PathRect (ImDrawList* self, const ImVec2 rect_min, const ImVec2 rect_max, float rounding, int rounding_corners_flags);
extern(C) nothrow void ImDrawList_ChannelsSplit (ImDrawList* self, int channels_count);
extern(C) nothrow void ImDrawList_ChannelsMerge (ImDrawList* self);
extern(C) nothrow void ImDrawList_ChannelsSetCurrent (ImDrawList* self, int channel_index);
extern(C) nothrow void ImDrawList_AddCallback (ImDrawList* self, ImDrawCallback callback, void* callback_data);
extern(C) nothrow void ImDrawList_AddDrawCmd (ImDrawList* self);
extern(C) nothrow ImDrawList* ImDrawList_CloneOutput (ImDrawList* self);
extern(C) nothrow void ImDrawList_Clear (ImDrawList* self);
extern(C) nothrow void ImDrawList_ClearFreeMemory (ImDrawList* self);
extern(C) nothrow void ImDrawList_PrimReserve (ImDrawList* self, int idx_count, int vtx_count);
extern(C) nothrow void ImDrawList_PrimRect (ImDrawList* self, const ImVec2 a, const ImVec2 b, ImU32 col);
extern(C) nothrow void ImDrawList_PrimRectUV (ImDrawList* self, const ImVec2 a, const ImVec2 b, const ImVec2 uv_a, const ImVec2 uv_b, ImU32 col);
extern(C) nothrow void ImDrawList_PrimQuadUV (ImDrawList* self, const ImVec2 a, const ImVec2 b, const ImVec2 c, const ImVec2 d, const ImVec2 uv_a, const ImVec2 uv_b, const ImVec2 uv_c, const ImVec2 uv_d, ImU32 col);
extern(C) nothrow void ImDrawList_PrimWriteVtx (ImDrawList* self, const ImVec2 pos, const ImVec2 uv, ImU32 col);
extern(C) nothrow void ImDrawList_PrimWriteIdx (ImDrawList* self, ImDrawIdx idx);
extern(C) nothrow void ImDrawList_PrimVtx (ImDrawList* self, const ImVec2 pos, const ImVec2 uv, ImU32 col);
extern(C) nothrow void ImDrawList_UpdateClipRect (ImDrawList* self);
extern(C) nothrow void ImDrawList_UpdateTextureID (ImDrawList* self);
extern(C) nothrow ImDrawData* ImDrawData_ImDrawData ();
extern(C) nothrow void ImDrawData_destroy (ImDrawData* self);
extern(C) nothrow void ImDrawData_Clear (ImDrawData* self);
extern(C) nothrow void ImDrawData_DeIndexAllBuffers (ImDrawData* self);
extern(C) nothrow void ImDrawData_ScaleClipRects (ImDrawData* self, const ImVec2 sc);
extern(C) nothrow ImFontConfig* ImFontConfig_ImFontConfig ();
extern(C) nothrow void ImFontConfig_destroy (ImFontConfig* self);
extern(C) nothrow ImFontGlyphRangesBuilder* ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder ();
extern(C) nothrow void ImFontGlyphRangesBuilder_destroy (ImFontGlyphRangesBuilder* self);
extern(C) nothrow bool ImFontGlyphRangesBuilder_GetBit (ImFontGlyphRangesBuilder* self, int n);
extern(C) nothrow void ImFontGlyphRangesBuilder_SetBit (ImFontGlyphRangesBuilder* self, int n);
extern(C) nothrow void ImFontGlyphRangesBuilder_AddChar (ImFontGlyphRangesBuilder* self, ImWchar c);
extern(C) nothrow void ImFontGlyphRangesBuilder_AddText (ImFontGlyphRangesBuilder* self, const(char)* text, const(char)* text_end);
extern(C) nothrow void ImFontGlyphRangesBuilder_AddRanges (ImFontGlyphRangesBuilder* self, const(ImWchar)* ranges);
extern(C) nothrow void ImFontGlyphRangesBuilder_BuildRanges (ImFontGlyphRangesBuilder* self, ImVector_ImWchar* out_ranges);
extern(C) nothrow ImFontAtlas* ImFontAtlas_ImFontAtlas ();
extern(C) nothrow void ImFontAtlas_destroy (ImFontAtlas* self);
extern(C) nothrow ImFont* ImFontAtlas_AddFont (ImFontAtlas* self, const(ImFontConfig)* font_cfg);
extern(C) nothrow ImFont* ImFontAtlas_AddFontDefault (ImFontAtlas* self, const(ImFontConfig)* font_cfg);
extern(C) nothrow ImFont* ImFontAtlas_AddFontFromFileTTF (ImFontAtlas* self, const(char)* filename, float size_pixels, const(ImFontConfig)* font_cfg, const(ImWchar)* glyph_ranges);
extern(C) nothrow ImFont* ImFontAtlas_AddFontFromMemoryTTF (ImFontAtlas* self, void* font_data, int font_size, float size_pixels, const(ImFontConfig)* font_cfg, const(ImWchar)* glyph_ranges);
extern(C) nothrow ImFont* ImFontAtlas_AddFontFromMemoryCompressedTTF (ImFontAtlas* self, const(void)* compressed_font_data, int compressed_font_size, float size_pixels, const(ImFontConfig)* font_cfg, const(ImWchar)* glyph_ranges);
extern(C) nothrow ImFont* ImFontAtlas_AddFontFromMemoryCompressedBase85TTF (ImFontAtlas* self, const(char)* compressed_font_data_base85, float size_pixels, const(ImFontConfig)* font_cfg, const(ImWchar)* glyph_ranges);
extern(C) nothrow void ImFontAtlas_ClearInputData (ImFontAtlas* self);
extern(C) nothrow void ImFontAtlas_ClearTexData (ImFontAtlas* self);
extern(C) nothrow void ImFontAtlas_ClearFonts (ImFontAtlas* self);
extern(C) nothrow void ImFontAtlas_Clear (ImFontAtlas* self);
extern(C) nothrow bool ImFontAtlas_Build (ImFontAtlas* self);
extern(C) nothrow void ImFontAtlas_GetTexDataAsAlpha8 (ImFontAtlas* self, ubyte** out_pixels, int* out_width, int* out_height, int* out_bytes_per_pixel);
extern(C) nothrow void ImFontAtlas_GetTexDataAsRGBA32 (ImFontAtlas* self, ubyte** out_pixels, int* out_width, int* out_height, int* out_bytes_per_pixel);
extern(C) nothrow bool ImFontAtlas_IsBuilt (ImFontAtlas* self);
extern(C) nothrow void ImFontAtlas_SetTexID (ImFontAtlas* self, ImTextureID id);
extern(C) nothrow const(ImWchar)* ImFontAtlas_GetGlyphRangesDefault (ImFontAtlas* self);
extern(C) nothrow const(ImWchar)* ImFontAtlas_GetGlyphRangesKorean (ImFontAtlas* self);
extern(C) nothrow const(ImWchar)* ImFontAtlas_GetGlyphRangesJapanese (ImFontAtlas* self);
extern(C) nothrow const(ImWchar)* ImFontAtlas_GetGlyphRangesChineseFull (ImFontAtlas* self);
extern(C) nothrow const(ImWchar)* ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon (ImFontAtlas* self);
extern(C) nothrow const(ImWchar)* ImFontAtlas_GetGlyphRangesCyrillic (ImFontAtlas* self);
extern(C) nothrow const(ImWchar)* ImFontAtlas_GetGlyphRangesThai (ImFontAtlas* self);
extern(C) nothrow CustomRect* CustomRect_CustomRect ();
extern(C) nothrow void CustomRect_destroy (CustomRect* self);
extern(C) nothrow bool CustomRect_IsPacked (CustomRect* self);
extern(C) nothrow int ImFontAtlas_AddCustomRectRegular (ImFontAtlas* self, uint id, int width, int height);
extern(C) nothrow int ImFontAtlas_AddCustomRectFontGlyph (ImFontAtlas* self, ImFont* font, ImWchar id, int width, int height, float advance_x, const ImVec2 offset);
extern(C) nothrow const(CustomRect)* ImFontAtlas_GetCustomRectByIndex (ImFontAtlas* self, int index);
extern(C) nothrow void ImFontAtlas_CalcCustomRectUV (ImFontAtlas* self, const(CustomRect)* rect, ImVec2* out_uv_min, ImVec2* out_uv_max);
extern(C) nothrow bool ImFontAtlas_GetMouseCursorTexData (ImFontAtlas* self, ImGuiMouseCursor cursor, ImVec2* out_offset, ImVec2* out_size, ref ImVec2[2] out_uv_border, ref ImVec2[2] out_uv_fill);
extern(C) nothrow ImFont* ImFont_ImFont ();
extern(C) nothrow void ImFont_destroy (ImFont* self);
extern(C) nothrow void ImFont_ClearOutputData (ImFont* self);
extern(C) nothrow void ImFont_BuildLookupTable (ImFont* self);
extern(C) nothrow const(ImFontGlyph)* ImFont_FindGlyph (ImFont* self, ImWchar c);
extern(C) nothrow const(ImFontGlyph)* ImFont_FindGlyphNoFallback (ImFont* self, ImWchar c);
extern(C) nothrow void ImFont_SetFallbackChar (ImFont* self, ImWchar c);
extern(C) nothrow float ImFont_GetCharAdvance (ImFont* self, ImWchar c);
extern(C) nothrow bool ImFont_IsLoaded (ImFont* self);
extern(C) nothrow const(char)* ImFont_GetDebugName (ImFont* self);
extern(C) nothrow ImVec2 ImFont_CalcTextSizeA (ImFont* self, float size, float max_width, float wrap_width, const(char)* text_begin, const(char)* text_end, const(char*)* remaining);
extern(C) nothrow const(char)* ImFont_CalcWordWrapPositionA (ImFont* self, float scale, const(char)* text, const(char)* text_end, float wrap_width);
extern(C) nothrow void ImFont_RenderChar (ImFont* self, ImDrawList* draw_list, float size, ImVec2 pos, ImU32 col, ImWchar c);
extern(C) nothrow void ImFont_RenderText (ImFont* self, ImDrawList* draw_list, float size, ImVec2 pos, ImU32 col, const ImVec4 clip_rect, const(char)* text_begin, const(char)* text_end, float wrap_width, bool cpu_fine_clip);
extern(C) nothrow void ImFont_GrowIndex (ImFont* self, int new_size);
extern(C) nothrow void ImFont_AddGlyph (ImFont* self, ImWchar c, float x0, float y0, float x1, float y1, float u0, float v0, float u1, float v1, float advance_x);
extern(C) nothrow void ImFont_AddRemapChar (ImFont* self, ImWchar dst, ImWchar src, bool overwrite_dst);
extern(C) nothrow void igGetWindowPos_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetWindowPos_nonUDT2 ();
extern(C) nothrow void igGetWindowSize_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetWindowSize_nonUDT2 ();
extern(C) nothrow void igGetContentRegionMax_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetContentRegionMax_nonUDT2 ();
extern(C) nothrow void igGetContentRegionAvail_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetContentRegionAvail_nonUDT2 ();
extern(C) nothrow void igGetWindowContentRegionMin_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetWindowContentRegionMin_nonUDT2 ();
extern(C) nothrow void igGetWindowContentRegionMax_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetWindowContentRegionMax_nonUDT2 ();
extern(C) nothrow void igGetFontTexUvWhitePixel_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetFontTexUvWhitePixel_nonUDT2 ();
extern(C) nothrow void igGetCursorPos_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetCursorPos_nonUDT2 ();
extern(C) nothrow void igGetCursorStartPos_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetCursorStartPos_nonUDT2 ();
extern(C) nothrow void igGetCursorScreenPos_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetCursorScreenPos_nonUDT2 ();
extern(C) nothrow void igGetItemRectMin_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetItemRectMin_nonUDT2 ();
extern(C) nothrow void igGetItemRectMax_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetItemRectMax_nonUDT2 ();
extern(C) nothrow void igGetItemRectSize_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetItemRectSize_nonUDT2 ();
extern(C) nothrow void igCalcTextSize_nonUDT (ImVec2* pOut, const(char)* text, const(char)* text_end, bool hide_text_after_double_hash, float wrap_width);
extern(C) nothrow ImVec2_Simple igCalcTextSize_nonUDT2 (const(char)* text, const(char)* text_end, bool hide_text_after_double_hash, float wrap_width);
extern(C) nothrow void igColorConvertU32ToFloat4_nonUDT (ImVec4* pOut, ImU32 in_);
extern(C) nothrow ImVec4_Simple igColorConvertU32ToFloat4_nonUDT2 (ImU32 in_);
extern(C) nothrow void igGetMousePos_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetMousePos_nonUDT2 ();
extern(C) nothrow void igGetMousePosOnOpeningCurrentPopup_nonUDT (ImVec2* pOut);
extern(C) nothrow ImVec2_Simple igGetMousePosOnOpeningCurrentPopup_nonUDT2 ();
extern(C) nothrow void igGetMouseDragDelta_nonUDT (ImVec2* pOut, int button, float lock_threshold);
extern(C) nothrow ImVec2_Simple igGetMouseDragDelta_nonUDT2 (int button, float lock_threshold);
extern(C) nothrow void ImColor_HSV_nonUDT (ImColor* pOut, ImColor* self, float h, float s, float v, float a);
extern(C) nothrow ImColor_Simple ImColor_HSV_nonUDT2 (ImColor* self, float h, float s, float v, float a);
extern(C) nothrow void ImDrawList_GetClipRectMin_nonUDT (ImVec2* pOut, ImDrawList* self);
extern(C) nothrow ImVec2_Simple ImDrawList_GetClipRectMin_nonUDT2 (ImDrawList* self);
extern(C) nothrow void ImDrawList_GetClipRectMax_nonUDT (ImVec2* pOut, ImDrawList* self);
extern(C) nothrow ImVec2_Simple ImDrawList_GetClipRectMax_nonUDT2 (ImDrawList* self);
extern(C) nothrow void ImFont_CalcTextSizeA_nonUDT (ImVec2* pOut, ImFont* self, float size, float max_width, float wrap_width, const(char)* text_begin, const(char)* text_end, const(char*)* remaining);
extern(C) nothrow ImVec2_Simple ImFont_CalcTextSizeA_nonUDT2 (ImFont* self, float size, float max_width, float wrap_width, const(char)* text_begin, const(char)* text_end, const(char*)* remaining);
extern(C) nothrow void igLogText (const(char)* fmt, ...);
extern(C) nothrow void ImGuiTextBuffer_appendf (ImGuiTextBuffer* buffer, const(char)* fmt, ...);
extern(C) nothrow float igGET_FLT_MAX ();
extern(C) nothrow void igColorConvertRGBtoHSV (float r, float g, float b, float* out_h, float* out_s, float* out_v);
extern(C) nothrow void igColorConvertHSVtoRGB (float h, float s, float v, float* out_r, float* out_g, float* out_b);
extern(C) nothrow ImVector_ImWchar* ImVector_ImWchar_create ();
extern(C) nothrow void ImVector_ImWchar_destroy (ImVector_ImWchar* p);
extern(C) nothrow void ImVector_ImWchar_Init (ImVector_ImWchar* p);
extern(C) nothrow void ImVector_ImWchar_UnInit (ImVector_ImWchar* p);
