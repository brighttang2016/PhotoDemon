VERSION 5.00
Begin VB.Form FormMain 
   BackColor       =   &H80000010&
   Caption         =   "PhotoDemon by Tanner Helland - www.photodemon.org"
   ClientHeight    =   11130
   ClientLeft      =   1290
   ClientTop       =   1065
   ClientWidth     =   15510
   DrawStyle       =   5  'Transparent
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   HasDC           =   0   'False
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   OLEDropMode     =   1  'Manual
   ScaleHeight     =   742
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   1034
   Begin PhotoDemon.pdAccelerator pdHotkeys 
      Left            =   120
      Top             =   2280
      _ExtentX        =   661
      _ExtentY        =   661
   End
   Begin VB.Timer tmrMetadata 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   120
      Top             =   600
   End
   Begin VB.Timer tmrCountdown 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   120
      Top             =   120
   End
   Begin PhotoDemon.pdCanvas mainCanvas 
      Height          =   5055
      Index           =   0
      Left            =   2640
      TabIndex        =   0
      Top             =   120
      Width           =   5895
      _ExtentX        =   10398
      _ExtentY        =   6588
   End
   Begin PhotoDemon.pdDownload asyncDownloader 
      Left            =   120
      Top             =   1680
      _ExtentX        =   873
      _ExtentY        =   873
   End
   Begin PhotoDemon.ShellPipe shellPipeMain 
      Left            =   120
      Top             =   1080
      _ExtentX        =   635
      _ExtentY        =   635
      ErrAsOut        =   0   'False
      PollInterval    =   100
      WaitForIdle     =   0
   End
   Begin VB.Menu MnuFileTop 
      Caption         =   "&File"
      Begin VB.Menu MnuFile 
         Caption         =   "&New..."
         Index           =   0
      End
      Begin VB.Menu MnuFile 
         Caption         =   "&Open..."
         Index           =   1
      End
      Begin VB.Menu MnuFile 
         Caption         =   "Open &recent"
         Index           =   2
         Begin VB.Menu mnuRecDocs 
            Caption         =   "Empty"
            Enabled         =   0   'False
            Index           =   0
         End
         Begin VB.Menu MnuRecentSepBar1 
            Caption         =   "-"
         End
         Begin VB.Menu MnuLoadAllMRU 
            Caption         =   "Load all recent images"
         End
         Begin VB.Menu MnuClearMRU 
            Caption         =   "Clear recent image list"
         End
      End
      Begin VB.Menu MnuFile 
         Caption         =   "&Import"
         Index           =   3
         Begin VB.Menu MnuImportClipboard 
            Caption         =   "From clipboard"
         End
         Begin VB.Menu MnuImportSepBar0 
            Caption         =   "-"
         End
         Begin VB.Menu MnuScanImage 
            Caption         =   "From scanner or camera..."
         End
         Begin VB.Menu MnuSelectScanner 
            Caption         =   "Select which scanner or camera to use"
         End
         Begin VB.Menu MnuImportSepBar1 
            Caption         =   "-"
         End
         Begin VB.Menu MnuImportFromInternet 
            Caption         =   "Online image..."
         End
         Begin VB.Menu MnuImportSepBar2 
            Caption         =   "-"
         End
         Begin VB.Menu MnuScreenCapture 
            Caption         =   "Screenshot..."
         End
      End
      Begin VB.Menu MnuFile 
         Caption         =   "-"
         Index           =   4
      End
      Begin VB.Menu MnuFile 
         Caption         =   "&Close"
         Index           =   5
      End
      Begin VB.Menu MnuFile 
         Caption         =   "Close all"
         Index           =   6
      End
      Begin VB.Menu MnuFile 
         Caption         =   "-"
         Index           =   7
      End
      Begin VB.Menu MnuFile 
         Caption         =   "&Save"
         Index           =   8
      End
      Begin VB.Menu MnuFile 
         Caption         =   "Save copy (&lossless)"
         Index           =   9
      End
      Begin VB.Menu MnuFile 
         Caption         =   "Save &as..."
         Index           =   10
      End
      Begin VB.Menu MnuFile 
         Caption         =   "Revert"
         Index           =   11
      End
      Begin VB.Menu MnuFile 
         Caption         =   "-"
         Index           =   12
      End
      Begin VB.Menu MnuFile 
         Caption         =   "&Batch operations"
         Index           =   13
         Begin VB.Menu MnuBatch 
            Caption         =   "Process..."
            Index           =   0
         End
         Begin VB.Menu MnuBatch 
            Caption         =   "Repair..."
            Index           =   1
         End
      End
      Begin VB.Menu MnuFile 
         Caption         =   "-"
         Index           =   14
      End
      Begin VB.Menu MnuFile 
         Caption         =   "&Print..."
         Index           =   15
      End
      Begin VB.Menu MnuFile 
         Caption         =   "-"
         Index           =   16
      End
      Begin VB.Menu MnuFile 
         Caption         =   "E&xit"
         Index           =   17
      End
   End
   Begin VB.Menu MnuEditTop 
      Caption         =   "&Edit"
      Begin VB.Menu MnuEdit 
         Caption         =   "&Undo"
         Index           =   0
      End
      Begin VB.Menu MnuEdit 
         Caption         =   "&Redo"
         Index           =   1
      End
      Begin VB.Menu MnuEdit 
         Caption         =   "Undo history..."
         Index           =   2
      End
      Begin VB.Menu MnuEdit 
         Caption         =   "-"
         Index           =   3
      End
      Begin VB.Menu MnuEdit 
         Caption         =   "Repeat &last action"
         Enabled         =   0   'False
         Index           =   4
      End
      Begin VB.Menu MnuEdit 
         Caption         =   "Fade..."
         Index           =   5
      End
      Begin VB.Menu MnuEdit 
         Caption         =   "-"
         Index           =   6
      End
      Begin VB.Menu MnuEdit 
         Caption         =   "Cu&t"
         Index           =   7
      End
      Begin VB.Menu MnuEdit 
         Caption         =   "Cut from layer"
         Index           =   8
      End
      Begin VB.Menu MnuEdit 
         Caption         =   "&Copy"
         Index           =   9
      End
      Begin VB.Menu MnuEdit 
         Caption         =   "Copy from layer"
         Index           =   10
      End
      Begin VB.Menu MnuEdit 
         Caption         =   "&Paste as new image"
         Index           =   11
      End
      Begin VB.Menu MnuEdit 
         Caption         =   "Paste as new layer"
         Index           =   12
      End
      Begin VB.Menu MnuEdit 
         Caption         =   "-"
         Index           =   13
      End
      Begin VB.Menu MnuEdit 
         Caption         =   "&Empty clipboard"
         Index           =   14
      End
   End
   Begin VB.Menu MnuView 
      Caption         =   "&View"
      Begin VB.Menu MnuFitOnScreen 
         Caption         =   "&Fit image on screen"
      End
      Begin VB.Menu MnuViewSepBar0 
         Caption         =   "-"
      End
      Begin VB.Menu MnuZoomIn 
         Caption         =   "Zoom &in"
      End
      Begin VB.Menu MnuZoomOut 
         Caption         =   "Zoom &out"
      End
      Begin VB.Menu MnuViewSepBar1 
         Caption         =   "-"
      End
      Begin VB.Menu MnuSpecificZoom 
         Caption         =   "16:1 (1600%)"
         Index           =   0
      End
      Begin VB.Menu MnuSpecificZoom 
         Caption         =   "8:1 (800%)"
         Index           =   1
      End
      Begin VB.Menu MnuSpecificZoom 
         Caption         =   "4:1 (400%)"
         Index           =   2
      End
      Begin VB.Menu MnuSpecificZoom 
         Caption         =   "2:1 (200%)"
         Index           =   3
      End
      Begin VB.Menu MnuSpecificZoom 
         Caption         =   "1:1 (actual size, 100%)"
         Index           =   4
      End
      Begin VB.Menu MnuSpecificZoom 
         Caption         =   "1:2 (50%)"
         Index           =   5
      End
      Begin VB.Menu MnuSpecificZoom 
         Caption         =   "1:4 (25%)"
         Index           =   6
      End
      Begin VB.Menu MnuSpecificZoom 
         Caption         =   "1:8 (12.5%)"
         Index           =   7
      End
      Begin VB.Menu MnuSpecificZoom 
         Caption         =   "1:16 (6.25%)"
         Index           =   8
      End
   End
   Begin VB.Menu MnuImageTop 
      Caption         =   "&Image"
      Begin VB.Menu MnuImage 
         Caption         =   "&Duplicate"
         Index           =   0
      End
      Begin VB.Menu MnuImage 
         Caption         =   "-"
         Index           =   1
      End
      Begin VB.Menu MnuImage 
         Caption         =   "Resize..."
         Index           =   2
      End
      Begin VB.Menu MnuImage 
         Caption         =   "Content-aware resize..."
         Index           =   3
      End
      Begin VB.Menu MnuImage 
         Caption         =   "-"
         Index           =   4
      End
      Begin VB.Menu MnuImage 
         Caption         =   "Canvas size..."
         Index           =   5
      End
      Begin VB.Menu MnuImage 
         Caption         =   "Fit canvas to active layer"
         Index           =   6
      End
      Begin VB.Menu MnuImage 
         Caption         =   "Fit canvas around all layers"
         Index           =   7
      End
      Begin VB.Menu MnuImage 
         Caption         =   "-"
         Index           =   8
      End
      Begin VB.Menu MnuImage 
         Caption         =   "Crop to selection"
         Index           =   9
      End
      Begin VB.Menu MnuImage 
         Caption         =   "Trim empty borders"
         Index           =   10
      End
      Begin VB.Menu MnuImage 
         Caption         =   "-"
         Index           =   11
      End
      Begin VB.Menu MnuImage 
         Caption         =   "Rotate"
         Index           =   12
         Begin VB.Menu MnuRotate 
            Caption         =   "Straighten..."
            Index           =   0
         End
         Begin VB.Menu MnuRotate 
            Caption         =   "-"
            Index           =   1
         End
         Begin VB.Menu MnuRotate 
            Caption         =   "90 clockwise"
            Index           =   2
         End
         Begin VB.Menu MnuRotate 
            Caption         =   "90 counter-clockwise"
            Index           =   3
         End
         Begin VB.Menu MnuRotate 
            Caption         =   "180"
            Index           =   4
         End
         Begin VB.Menu MnuRotate 
            Caption         =   "Arbitrary..."
            Index           =   5
         End
      End
      Begin VB.Menu MnuImage 
         Caption         =   "Flip horizontal"
         Index           =   13
      End
      Begin VB.Menu MnuImage 
         Caption         =   "Flip vertical"
         Index           =   14
      End
      Begin VB.Menu MnuImage 
         Caption         =   "-"
         Index           =   15
      End
      Begin VB.Menu MnuImage 
         Caption         =   "Metadata"
         Index           =   16
         Begin VB.Menu MnuMetadata 
            Caption         =   "Edit metadata..."
            Index           =   0
         End
         Begin VB.Menu MnuMetadata 
            Caption         =   "-"
            Index           =   1
         End
         Begin VB.Menu MnuMetadata 
            Caption         =   "Count unique colors"
            Index           =   2
         End
         Begin VB.Menu MnuMetadata 
            Caption         =   "Map photo location..."
            Index           =   3
         End
      End
   End
   Begin VB.Menu MnuLayerTop 
      Caption         =   "&Layer"
      Begin VB.Menu MnuLayer 
         Caption         =   "Add"
         Index           =   0
         Begin VB.Menu MnuLayerNew 
            Caption         =   "Blank layer"
            Index           =   0
         End
         Begin VB.Menu MnuLayerNew 
            Caption         =   "Duplicate of current layer"
            Index           =   1
         End
         Begin VB.Menu MnuLayerNew 
            Caption         =   "-"
            Index           =   2
         End
         Begin VB.Menu MnuLayerNew 
            Caption         =   "From clipboard"
            Index           =   3
         End
         Begin VB.Menu MnuLayerNew 
            Caption         =   "From file..."
            Index           =   4
         End
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "Delete"
         Index           =   1
         Begin VB.Menu MnuLayerDelete 
            Caption         =   "Current layer"
            Index           =   0
         End
         Begin VB.Menu MnuLayerDelete 
            Caption         =   "Hidden layers"
            Index           =   1
         End
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "-"
         Index           =   2
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "Merge up"
         Index           =   3
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "Merge down"
         Index           =   4
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "Order"
         Index           =   5
         Begin VB.Menu MnuLayerOrder 
            Caption         =   "Raise layer"
            Index           =   0
         End
         Begin VB.Menu MnuLayerOrder 
            Caption         =   "Lower layer"
            Index           =   1
         End
         Begin VB.Menu MnuLayerOrder 
            Caption         =   "-"
            Index           =   2
         End
         Begin VB.Menu MnuLayerOrder 
            Caption         =   "Layer to top"
            Index           =   3
         End
         Begin VB.Menu MnuLayerOrder 
            Caption         =   "Layer to bottom"
            Index           =   4
         End
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "-"
         Index           =   6
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "Orientation"
         Index           =   7
         Begin VB.Menu MnuLayerOrientation 
            Caption         =   "Straighten..."
            Index           =   0
         End
         Begin VB.Menu MnuLayerOrientation 
            Caption         =   "-"
            Index           =   1
         End
         Begin VB.Menu MnuLayerOrientation 
            Caption         =   "Rotate 90 clockwise"
            Index           =   2
         End
         Begin VB.Menu MnuLayerOrientation 
            Caption         =   "Rotate 90 counter-clockwise"
            Index           =   3
         End
         Begin VB.Menu MnuLayerOrientation 
            Caption         =   "Rotate 180"
            Index           =   4
         End
         Begin VB.Menu MnuLayerOrientation 
            Caption         =   "Rotate arbitrary..."
            Index           =   5
         End
         Begin VB.Menu MnuLayerOrientation 
            Caption         =   "-"
            Index           =   6
         End
         Begin VB.Menu MnuLayerOrientation 
            Caption         =   "Flip horizontal"
            Index           =   7
         End
         Begin VB.Menu MnuLayerOrientation 
            Caption         =   "Flip vertical"
            Index           =   8
         End
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "Size"
         Index           =   8
         Begin VB.Menu MnuLayerSize 
            Caption         =   "Reset to actual size"
            Index           =   0
         End
         Begin VB.Menu MnuLayerSize 
            Caption         =   "-"
            Index           =   1
         End
         Begin VB.Menu MnuLayerSize 
            Caption         =   "Resize..."
            Index           =   2
         End
         Begin VB.Menu MnuLayerSize 
            Caption         =   "Content-aware resize..."
            Index           =   3
         End
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "Crop to selection"
         Index           =   9
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "-"
         Index           =   10
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "Transparency"
         Index           =   11
         Begin VB.Menu MnuLayerTransparency 
            Caption         =   "Make color transparent..."
            Index           =   0
         End
         Begin VB.Menu MnuLayerTransparency 
            Caption         =   "Remove transparency..."
            Index           =   1
         End
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "-"
         Index           =   12
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "Rasterize"
         Index           =   13
         Begin VB.Menu MnuLayerRasterize 
            Caption         =   "Current layer"
            Index           =   0
         End
         Begin VB.Menu MnuLayerRasterize 
            Caption         =   "All layers"
            Index           =   1
         End
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "-"
         Index           =   14
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "Flatten image..."
         Index           =   15
      End
      Begin VB.Menu MnuLayer 
         Caption         =   "Merge visible layers"
         Index           =   16
      End
   End
   Begin VB.Menu MnuSelectTop 
      Caption         =   "&Select"
      Begin VB.Menu MnuSelect 
         Caption         =   "All"
         Index           =   0
      End
      Begin VB.Menu MnuSelect 
         Caption         =   "None"
         Index           =   1
      End
      Begin VB.Menu MnuSelect 
         Caption         =   "Invert"
         Index           =   2
      End
      Begin VB.Menu MnuSelect 
         Caption         =   "-"
         Index           =   3
      End
      Begin VB.Menu MnuSelect 
         Caption         =   "Grow..."
         Index           =   4
      End
      Begin VB.Menu MnuSelect 
         Caption         =   "Shrink..."
         Index           =   5
      End
      Begin VB.Menu MnuSelect 
         Caption         =   "Border..."
         Index           =   6
      End
      Begin VB.Menu MnuSelect 
         Caption         =   "Feather..."
         Index           =   7
      End
      Begin VB.Menu MnuSelect 
         Caption         =   "Sharpen..."
         Index           =   8
      End
      Begin VB.Menu MnuSelect 
         Caption         =   "-"
         Index           =   9
      End
      Begin VB.Menu MnuSelect 
         Caption         =   "Erase selected area"
         Index           =   10
      End
      Begin VB.Menu MnuSelect 
         Caption         =   "-"
         Index           =   11
      End
      Begin VB.Menu MnuSelect 
         Caption         =   "Load selection..."
         Index           =   12
      End
      Begin VB.Menu MnuSelect 
         Caption         =   "Save current selection..."
         Index           =   13
      End
      Begin VB.Menu MnuSelect 
         Caption         =   "Export"
         Index           =   14
         Begin VB.Menu MnuSelectExport 
            Caption         =   "Selected area as image..."
            Index           =   0
         End
         Begin VB.Menu MnuSelectExport 
            Caption         =   "Selection mask as image..."
            Index           =   1
         End
      End
   End
   Begin VB.Menu MnuAdjustmentsTop 
      Caption         =   "&Adjustments"
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Auto correct"
         Index           =   0
         Begin VB.Menu MnuAutoCorrect 
            Caption         =   "Color"
            Index           =   0
         End
         Begin VB.Menu MnuAutoCorrect 
            Caption         =   "Contrast"
            Index           =   1
         End
         Begin VB.Menu MnuAutoCorrect 
            Caption         =   "Lighting"
            Index           =   2
         End
         Begin VB.Menu MnuAutoCorrect 
            Caption         =   "Shadows and highlights"
            Index           =   3
         End
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Auto enhance"
         Index           =   1
         Begin VB.Menu MnuAutoEnhance 
            Caption         =   "Color"
            Index           =   0
         End
         Begin VB.Menu MnuAutoEnhance 
            Caption         =   "Contrast"
            Index           =   1
         End
         Begin VB.Menu MnuAutoEnhance 
            Caption         =   "Lighting"
            Index           =   2
         End
         Begin VB.Menu MnuAutoEnhance 
            Caption         =   "Shadows and highlights"
            Index           =   3
         End
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "-"
         Index           =   2
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Black and white..."
         Index           =   3
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Brightness and contrast..."
         Index           =   4
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Color balance..."
         Index           =   5
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Curves..."
         Index           =   6
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Levels..."
         Index           =   7
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Shadows and highlights..."
         Index           =   8
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Vibrance..."
         Index           =   9
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "White balance..."
         Index           =   10
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "-"
         Index           =   11
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Channels"
         Index           =   12
         Begin VB.Menu MnuColorComponents 
            Caption         =   "Channel mixer..."
            Index           =   0
         End
         Begin VB.Menu MnuColorComponents 
            Caption         =   "Rechannel..."
            Index           =   1
         End
         Begin VB.Menu MnuColorComponents 
            Caption         =   "-"
            Index           =   2
         End
         Begin VB.Menu MnuColorComponents 
            Caption         =   "Maximum channel"
            Index           =   3
         End
         Begin VB.Menu MnuColorComponents 
            Caption         =   "Minimum channel"
            Index           =   4
         End
         Begin VB.Menu MnuColorComponents 
            Caption         =   "-"
            Index           =   5
         End
         Begin VB.Menu MnuColorComponents 
            Caption         =   "Shift channels left"
            Index           =   6
         End
         Begin VB.Menu MnuColorComponents 
            Caption         =   "Shift channels right"
            Index           =   7
         End
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Color"
         Index           =   13
         Begin VB.Menu MnuColor 
            Caption         =   "Color balance..."
            Index           =   0
         End
         Begin VB.Menu MnuColor 
            Caption         =   "White balance..."
            Index           =   1
         End
         Begin VB.Menu MnuColor 
            Caption         =   "-"
            Index           =   2
         End
         Begin VB.Menu MnuColor 
            Caption         =   "Hue and saturation..."
            Index           =   3
         End
         Begin VB.Menu MnuColor 
            Caption         =   "Temperature..."
            Index           =   4
         End
         Begin VB.Menu MnuColor 
            Caption         =   "Tint..."
            Index           =   5
         End
         Begin VB.Menu MnuColor 
            Caption         =   "Vibrance..."
            Index           =   6
         End
         Begin VB.Menu MnuColor 
            Caption         =   "-"
            Index           =   7
         End
         Begin VB.Menu MnuColor 
            Caption         =   "Black and white..."
            Index           =   8
         End
         Begin VB.Menu MnuColor 
            Caption         =   "Colorize..."
            Index           =   9
         End
         Begin VB.Menu MnuColor 
            Caption         =   "Replace color..."
            Index           =   10
         End
         Begin VB.Menu MnuColor 
            Caption         =   "Sepia"
            Index           =   11
         End
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Histogram"
         Index           =   14
         Begin VB.Menu MnuHistogram 
            Caption         =   "Display histogram"
         End
         Begin VB.Menu mnuHistogramSepBar1 
            Caption         =   "-"
         End
         Begin VB.Menu MnuHistogramEqualize 
            Caption         =   "Equalize..."
         End
         Begin VB.Menu MnuHistogramStretch 
            Caption         =   "Stretch"
         End
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Invert"
         Index           =   15
         Begin VB.Menu MnuNegative 
            Caption         =   "Invert CMYK (film negative)"
         End
         Begin VB.Menu MnuInvertHue 
            Caption         =   "Invert hue"
         End
         Begin VB.Menu mnuInvert 
            Caption         =   "Invert RGB"
         End
         Begin VB.Menu mnuInvertSepBar0 
            Caption         =   "-"
         End
         Begin VB.Menu MnuCompoundInvert 
            Caption         =   "Compound invert"
         End
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Lighting"
         Index           =   16
         Begin VB.Menu MnuLighting 
            Caption         =   "Brightness and contrast..."
            Index           =   0
         End
         Begin VB.Menu MnuLighting 
            Caption         =   "Curves..."
            Index           =   1
         End
         Begin VB.Menu MnuLighting 
            Caption         =   "Gamma..."
            Index           =   2
         End
         Begin VB.Menu MnuLighting 
            Caption         =   "Levels..."
            Index           =   3
         End
         Begin VB.Menu MnuLighting 
            Caption         =   "Shadows and highlights..."
            Index           =   4
         End
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Monochrome"
         Index           =   17
         Begin VB.Menu MnuMonochrome 
            Caption         =   "Color to monochrome..."
            Index           =   0
         End
         Begin VB.Menu MnuMonochrome 
            Caption         =   "Monochrome to grayscale..."
            Index           =   1
         End
      End
      Begin VB.Menu MnuAdjustments 
         Caption         =   "Photography"
         Index           =   18
         Begin VB.Menu MnuAdjustmentsPhoto 
            Caption         =   "Exposure..."
            Index           =   0
         End
         Begin VB.Menu MnuAdjustmentsPhoto 
            Caption         =   "HDR..."
            Index           =   1
         End
         Begin VB.Menu MnuAdjustmentsPhoto 
            Caption         =   "Photo filters..."
            Index           =   2
         End
         Begin VB.Menu MnuAdjustmentsPhoto 
            Caption         =   "Red-eye removal..."
            Index           =   3
         End
         Begin VB.Menu MnuAdjustmentsPhoto 
            Caption         =   "Split toning..."
            Index           =   4
         End
      End
   End
   Begin VB.Menu MnuEffectsTop 
      Caption         =   "Effe&cts"
      Begin VB.Menu MnuEffectUpper 
         Caption         =   "Artistic"
         Index           =   0
         Begin VB.Menu MnuArtistic 
            Caption         =   "Colored pencil..."
            Index           =   0
         End
         Begin VB.Menu MnuArtistic 
            Caption         =   "Comic book..."
            Index           =   1
         End
         Begin VB.Menu MnuArtistic 
            Caption         =   "Figured glass (dents)..."
            Index           =   2
         End
         Begin VB.Menu MnuArtistic 
            Caption         =   "Film noir..."
            Index           =   3
         End
         Begin VB.Menu MnuArtistic 
            Caption         =   "Glass tiles..."
            Index           =   4
         End
         Begin VB.Menu MnuArtistic 
            Caption         =   "Kaleiodoscope..."
            Index           =   5
         End
         Begin VB.Menu MnuArtistic 
            Caption         =   "Modern art..."
            Index           =   6
         End
         Begin VB.Menu MnuArtistic 
            Caption         =   "Oil painting..."
            Index           =   7
         End
         Begin VB.Menu MnuArtistic 
            Caption         =   "Posterize..."
            Index           =   8
         End
         Begin VB.Menu MnuArtistic 
            Caption         =   "Relief..."
            Index           =   9
         End
         Begin VB.Menu MnuArtistic 
            Caption         =   "Stained glass..."
            Index           =   10
         End
      End
      Begin VB.Menu MnuEffectUpper 
         Caption         =   "Blur"
         Index           =   1
         Begin VB.Menu MnuBlurFilter 
            Caption         =   "Box blur..."
            Index           =   0
         End
         Begin VB.Menu MnuBlurFilter 
            Caption         =   "Gaussian blur..."
            Index           =   1
         End
         Begin VB.Menu MnuBlurFilter 
            Caption         =   "Surface blur..."
            Index           =   2
         End
         Begin VB.Menu MnuBlurFilter 
            Caption         =   "-"
            Index           =   3
         End
         Begin VB.Menu MnuBlurFilter 
            Caption         =   "Motion blur..."
            Index           =   4
         End
         Begin VB.Menu MnuBlurFilter 
            Caption         =   "Radial blur..."
            Index           =   5
         End
         Begin VB.Menu MnuBlurFilter 
            Caption         =   "Zoom blur..."
            Index           =   6
         End
         Begin VB.Menu MnuBlurFilter 
            Caption         =   "-"
            Index           =   7
         End
         Begin VB.Menu MnuBlurFilter 
            Caption         =   "Kuwahara filter..."
            Index           =   8
         End
         Begin VB.Menu MnuBlurFilter 
            Caption         =   "Symmetric nearest-neighbor..."
            Index           =   9
         End
      End
      Begin VB.Menu MnuEffectUpper 
         Caption         =   "Distort"
         Index           =   2
         Begin VB.Menu MnuDistortEffects 
            Caption         =   "Apply lens distortion..."
            Index           =   0
         End
         Begin VB.Menu MnuDistortEffects 
            Caption         =   "Correct existing lens distortion..."
            Index           =   1
         End
         Begin VB.Menu MnuDistortEffects 
            Caption         =   "-"
            Index           =   2
         End
         Begin VB.Menu MnuDistortEffects 
            Caption         =   "Donut..."
            Index           =   3
         End
         Begin VB.Menu MnuDistortEffects 
            Caption         =   "Pinch and whirl..."
            Index           =   4
         End
         Begin VB.Menu MnuDistortEffects 
            Caption         =   "Poke..."
            Index           =   5
         End
         Begin VB.Menu MnuDistortEffects 
            Caption         =   "Ripple..."
            Index           =   6
         End
         Begin VB.Menu MnuDistortEffects 
            Caption         =   "Squish..."
            Index           =   7
         End
         Begin VB.Menu MnuDistortEffects 
            Caption         =   "Swirl..."
            Index           =   8
         End
         Begin VB.Menu MnuDistortEffects 
            Caption         =   "Waves..."
            Index           =   9
         End
         Begin VB.Menu MnuDistortEffects 
            Caption         =   "-"
            Index           =   10
         End
         Begin VB.Menu MnuDistortEffects 
            Caption         =   "Miscellaneous..."
            Index           =   11
         End
      End
      Begin VB.Menu MnuEffectUpper 
         Caption         =   "Edge"
         Index           =   3
         Begin VB.Menu MnuEdge 
            Caption         =   "Emboss..."
            Index           =   0
         End
         Begin VB.Menu MnuEdge 
            Caption         =   "Enhance edges..."
            Index           =   1
         End
         Begin VB.Menu MnuEdge 
            Caption         =   "Find edges..."
            Index           =   2
         End
         Begin VB.Menu MnuEdge 
            Caption         =   "Range filter..."
            Index           =   3
         End
         Begin VB.Menu MnuEdge 
            Caption         =   "Trace contour..."
            Index           =   4
         End
      End
      Begin VB.Menu MnuEffectUpper 
         Caption         =   "Light and shadow"
         Index           =   4
         Begin VB.Menu MnuLightShadow 
            Caption         =   "Black light..."
            Index           =   0
         End
         Begin VB.Menu MnuLightShadow 
            Caption         =   "Cross-screen..."
            Index           =   1
         End
         Begin VB.Menu MnuLightShadow 
            Caption         =   "Lens flare..."
            Index           =   2
         End
         Begin VB.Menu MnuLightShadow 
            Caption         =   "Rainbow..."
            Index           =   3
         End
         Begin VB.Menu MnuLightShadow 
            Caption         =   "Sunshine..."
            Index           =   4
         End
         Begin VB.Menu MnuLightShadow 
            Caption         =   "-"
            Index           =   5
         End
         Begin VB.Menu MnuLightShadow 
            Caption         =   "Dilate..."
            Index           =   6
         End
         Begin VB.Menu MnuLightShadow 
            Caption         =   "Erode..."
            Index           =   7
         End
      End
      Begin VB.Menu MnuEffectUpper 
         Caption         =   "Natural"
         Index           =   5
         Begin VB.Menu MnuNatureFilter 
            Caption         =   "Atmosphere"
            Index           =   0
         End
         Begin VB.Menu MnuNatureFilter 
            Caption         =   "Fog..."
            Index           =   1
         End
         Begin VB.Menu MnuNatureFilter 
            Caption         =   "Freeze"
            Index           =   2
         End
         Begin VB.Menu MnuNatureFilter 
            Caption         =   "Ignite..."
            Index           =   3
         End
         Begin VB.Menu MnuNatureFilter 
            Caption         =   "Lava"
            Index           =   4
         End
         Begin VB.Menu MnuNatureFilter 
            Caption         =   "Metal..."
            Index           =   5
         End
         Begin VB.Menu MnuNatureFilter 
            Caption         =   "Underwater"
            Index           =   6
         End
      End
      Begin VB.Menu MnuEffectUpper 
         Caption         =   "Noise"
         Index           =   6
         Begin VB.Menu MnuNoise 
            Caption         =   "Add film grain..."
            Index           =   0
         End
         Begin VB.Menu MnuNoise 
            Caption         =   "Add RGB noise..."
            Index           =   1
         End
         Begin VB.Menu MnuNoise 
            Caption         =   "-"
            Index           =   2
         End
         Begin VB.Menu MnuNoise 
            Caption         =   "Anisotropic diffusion..."
            Index           =   3
         End
         Begin VB.Menu MnuNoise 
            Caption         =   "Bilateral filter..."
            Index           =   4
         End
         Begin VB.Menu MnuNoise 
            Caption         =   "Mean shift..."
            Index           =   5
         End
         Begin VB.Menu MnuNoise 
            Caption         =   "Median..."
            Index           =   6
         End
      End
      Begin VB.Menu MnuEffectUpper 
         Caption         =   "Pixelate"
         Index           =   7
         Begin VB.Menu MnuPixelate 
            Caption         =   "Color halftone..."
            Index           =   0
         End
         Begin VB.Menu MnuPixelate 
            Caption         =   "Crystallize..."
            Index           =   1
         End
         Begin VB.Menu MnuPixelate 
            Caption         =   "Fragment..."
            Index           =   2
         End
         Begin VB.Menu MnuPixelate 
            Caption         =   "Mezzotint..."
            Index           =   3
         End
         Begin VB.Menu MnuPixelate 
            Caption         =   "Mosaic..."
            Index           =   4
         End
      End
      Begin VB.Menu MnuEffectUpper 
         Caption         =   "Sharpen"
         Index           =   8
         Begin VB.Menu MnuSharpen 
            Caption         =   "Sharpen..."
            Index           =   0
         End
         Begin VB.Menu MnuSharpen 
            Caption         =   "Unsharp masking..."
            Index           =   1
         End
      End
      Begin VB.Menu MnuEffectUpper 
         Caption         =   "Stylize"
         Index           =   9
         Begin VB.Menu MnuStylize 
            Caption         =   "Antique"
            Index           =   0
         End
         Begin VB.Menu MnuStylize 
            Caption         =   "Diffuse..."
            Index           =   1
         End
         Begin VB.Menu MnuStylize 
            Caption         =   "Outline..."
            Index           =   2
         End
         Begin VB.Menu MnuStylize 
            Caption         =   "Palettize..."
            Index           =   3
         End
         Begin VB.Menu MnuStylize 
            Caption         =   "Portrait glow..."
            Index           =   4
         End
         Begin VB.Menu MnuStylize 
            Caption         =   "Solarize..."
            Index           =   5
         End
         Begin VB.Menu MnuStylize 
            Caption         =   "Twins..."
            Index           =   6
         End
         Begin VB.Menu MnuStylize 
            Caption         =   "Vignetting..."
            Index           =   7
         End
      End
      Begin VB.Menu MnuEffectUpper 
         Caption         =   "Transform"
         Index           =   10
         Begin VB.Menu MnuEffectTransform 
            Caption         =   "Pan and zoom..."
            Index           =   0
         End
         Begin VB.Menu MnuEffectTransform 
            Caption         =   "Perspective..."
            Index           =   1
         End
         Begin VB.Menu MnuEffectTransform 
            Caption         =   "Polar conversion..."
            Index           =   2
         End
         Begin VB.Menu MnuEffectTransform 
            Caption         =   "Rotate..."
            Index           =   3
         End
         Begin VB.Menu MnuEffectTransform 
            Caption         =   "Shear..."
            Index           =   4
         End
         Begin VB.Menu MnuEffectTransform 
            Caption         =   "Spherize..."
            Index           =   5
         End
      End
      Begin VB.Menu MnuEffectUpper 
         Caption         =   "-"
         Index           =   11
      End
      Begin VB.Menu MnuCustomFilter 
         Caption         =   "Custom filter..."
      End
      Begin VB.Menu MnuFilterSepBar2 
         Caption         =   "-"
         Visible         =   0   'False
      End
      Begin VB.Menu MnuEffectExperimental 
         Caption         =   "Experimental"
         Index           =   4
         Visible         =   0   'False
         Begin VB.Menu MnuAlien 
            Caption         =   "Alien"
         End
         Begin VB.Menu MnuDream 
            Caption         =   "Dream"
         End
         Begin VB.Menu MnuNatureTest 
            Caption         =   "New freeze effect"
         End
         Begin VB.Menu MnuRadioactive 
            Caption         =   "Radioactive"
         End
         Begin VB.Menu MnuSynthesize 
            Caption         =   "Synthesize"
         End
         Begin VB.Menu MnuHeatmap 
            Caption         =   "Thermograph (heat map)"
         End
         Begin VB.Menu MnuVibrate 
            Caption         =   "Vibrate"
         End
      End
      Begin VB.Menu MnuTest 
         Caption         =   "Test"
      End
   End
   Begin VB.Menu MnuTools 
      Caption         =   "&Tools"
      Begin VB.Menu mnuTool 
         Caption         =   "Language"
         Index           =   0
         Begin VB.Menu mnuLanguages 
            Caption         =   "English (US)"
            Checked         =   -1  'True
            Index           =   0
         End
      End
      Begin VB.Menu mnuTool 
         Caption         =   "Language editor..."
         Index           =   1
      End
      Begin VB.Menu mnuTool 
         Caption         =   "-"
         Index           =   2
      End
      Begin VB.Menu mnuTool 
         Caption         =   "Record macro"
         Index           =   3
         Begin VB.Menu MnuRecordMacro 
            Caption         =   "Start recording"
            Index           =   0
         End
         Begin VB.Menu MnuRecordMacro 
            Caption         =   "Stop recording..."
            Enabled         =   0   'False
            Index           =   1
         End
      End
      Begin VB.Menu mnuTool 
         Caption         =   "Play macro..."
         Index           =   4
      End
      Begin VB.Menu mnuTool 
         Caption         =   "Recent macros"
         Index           =   5
         Begin VB.Menu MnuRecentMacros 
            Caption         =   "Empty"
            Enabled         =   0   'False
            Index           =   0
         End
         Begin VB.Menu MnuRecentMacroSepBar 
            Caption         =   "-"
            Index           =   0
         End
         Begin VB.Menu mnuClearRecentMacros 
            Caption         =   "Clear recent macro list"
         End
      End
      Begin VB.Menu mnuTool 
         Caption         =   "-"
         Index           =   6
      End
      Begin VB.Menu mnuTool 
         Caption         =   "Options"
         Index           =   7
      End
      Begin VB.Menu mnuTool 
         Caption         =   "Plugin manager"
         Index           =   8
      End
      Begin VB.Menu mnuTool 
         Caption         =   "-"
         Index           =   9
      End
      Begin VB.Menu mnuTool 
         Caption         =   "Developers"
         Index           =   10
         Begin VB.Menu MnuDevelopers 
            Caption         =   "Theme editor..."
            Index           =   0
         End
         Begin VB.Menu MnuDevelopers 
            Caption         =   "-"
            Index           =   1
         End
         Begin VB.Menu MnuDevelopers 
            Caption         =   "Light theme"
            Index           =   2
         End
         Begin VB.Menu MnuDevelopers 
            Caption         =   "Dark theme"
            Index           =   3
         End
         Begin VB.Menu MnuDevelopers 
            Caption         =   "-"
            Index           =   4
         End
         Begin VB.Menu MnuDevelopers 
            Caption         =   "Blue"
            Index           =   5
         End
         Begin VB.Menu MnuDevelopers 
            Caption         =   "Green"
            Index           =   6
         End
         Begin VB.Menu MnuDevelopers 
            Caption         =   "Purple"
            Index           =   7
         End
      End
   End
   Begin VB.Menu MnuWindowTop 
      Caption         =   "&Window"
      Begin VB.Menu MnuWindow 
         Caption         =   "Toolbox"
         Index           =   0
         Begin VB.Menu MnuWindowToolbox 
            Caption         =   "Display toolbox"
            Checked         =   -1  'True
            Index           =   0
         End
         Begin VB.Menu MnuWindowToolbox 
            Caption         =   "-"
            Index           =   1
         End
         Begin VB.Menu MnuWindowToolbox 
            Caption         =   "Display tool category titles"
            Checked         =   -1  'True
            Index           =   2
         End
         Begin VB.Menu MnuWindowToolbox 
            Caption         =   "-"
            Index           =   3
         End
         Begin VB.Menu MnuWindowToolbox 
            Caption         =   "Small buttons"
            Index           =   4
         End
         Begin VB.Menu MnuWindowToolbox 
            Caption         =   "Normal buttons"
            Checked         =   -1  'True
            Index           =   5
         End
         Begin VB.Menu MnuWindowToolbox 
            Caption         =   "Large buttons"
            Index           =   6
         End
      End
      Begin VB.Menu MnuWindow 
         Caption         =   "Tool options"
         Checked         =   -1  'True
         Index           =   1
      End
      Begin VB.Menu MnuWindow 
         Caption         =   "Layers"
         Checked         =   -1  'True
         Index           =   2
      End
      Begin VB.Menu MnuWindow 
         Caption         =   "Image tabstrip"
         Index           =   3
         Begin VB.Menu MnuWindowTabstrip 
            Caption         =   "Always show"
            Index           =   0
         End
         Begin VB.Menu MnuWindowTabstrip 
            Caption         =   "Show when multiple images are loaded"
            Index           =   1
         End
         Begin VB.Menu MnuWindowTabstrip 
            Caption         =   "Never show"
            Index           =   2
         End
         Begin VB.Menu MnuWindowTabstrip 
            Caption         =   "-"
            Index           =   3
         End
         Begin VB.Menu MnuWindowTabstrip 
            Caption         =   "Left"
            Index           =   4
         End
         Begin VB.Menu MnuWindowTabstrip 
            Caption         =   "Top"
            Index           =   5
         End
         Begin VB.Menu MnuWindowTabstrip 
            Caption         =   "Right"
            Index           =   6
         End
         Begin VB.Menu MnuWindowTabstrip 
            Caption         =   "Bottom"
            Index           =   7
         End
      End
      Begin VB.Menu MnuWindow 
         Caption         =   "-"
         Index           =   4
      End
      Begin VB.Menu MnuWindow 
         Caption         =   "Next image"
         Index           =   5
      End
      Begin VB.Menu MnuWindow 
         Caption         =   "Previous image"
         Index           =   6
      End
   End
   Begin VB.Menu MnuHelpTop 
      Caption         =   "&Help"
      Begin VB.Menu MnuHelp 
         Caption         =   "Support PhotoDemon with a small donation (thank you!)"
         Index           =   0
      End
      Begin VB.Menu MnuHelp 
         Caption         =   "-"
         Index           =   1
      End
      Begin VB.Menu MnuHelp 
         Caption         =   "Check for &updates"
         Index           =   2
      End
      Begin VB.Menu MnuHelp 
         Caption         =   "Submit feedback..."
         Index           =   3
      End
      Begin VB.Menu MnuHelp 
         Caption         =   "Submit bug report..."
         Index           =   4
      End
      Begin VB.Menu MnuHelp 
         Caption         =   "-"
         Index           =   5
      End
      Begin VB.Menu MnuHelp 
         Caption         =   "&Visit the PhotoDemon website"
         Index           =   6
      End
      Begin VB.Menu MnuHelp 
         Caption         =   "Download PhotoDemon's source code"
         Index           =   7
      End
      Begin VB.Menu MnuHelp 
         Caption         =   "Read PhotoDemon's license and terms of use"
         Index           =   8
      End
      Begin VB.Menu MnuHelp 
         Caption         =   "-"
         Index           =   9
      End
      Begin VB.Menu MnuHelp 
         Caption         =   "&About PhotoDemon"
         Index           =   10
      End
   End
End
Attribute VB_Name = "FormMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Please see the included README.txt file for additional information regarding licensing and redistribution.

'PhotoDemon is Copyright 1999-2017 by Tanner Helland, tannerhelland.com

'Please visit photodemon.org for updates and additional downloads

'***************************************************************************
'Primary PhotoDemon Window
'Copyright 2002-2017 by Tanner Helland
'Created: 15/September/02
'Last updated: 19/November/15
'Last update: rework the order of unloading classes, to ensure delayed clipboard rendering doesn't break
'
'This is PhotoDemon's main form.  In actuality, it contains relatively little code.  Its primary purpose is sending
' parameters to other, more interesting sections of the program.
'
'All source code in this file is licensed under a modified BSD license.  This means you may use the code in your own
' projects IF you provide attribution.  For more information, please visit http://photodemon.org/about/license/
'
'***************************************************************************

Option Explicit

'If one or more language file updates is downloaded and patched, this will be set to TRUE by the downloader.  When all updates finish,
' this value tells us to update the active language object if the currently in-use language was one of the ones we updated.
Private m_LanguagesUpdatedSuccessfully As Boolean

'Whenever the asynchronous downloader completes its work, we forcibly release all resources associated with downloads we've finished processing.
Private Sub asyncDownloader_FinishedAllItems(ByVal allDownloadsSuccessful As Boolean)
    
    'When all language updates have been processed and patched, check to see if a translation is active.  If it is, update the translation
    ' engine against the new language file.
    If m_LanguagesUpdatedSuccessfully Then
        
        m_LanguagesUpdatedSuccessfully = False
        
        'One or more language files were patched.  Notify the language engine that it potentially needs updating.  (The updating itself will
        ' be fired on the next processor call.)
        If g_Language.TranslationActive Then g_Language.NotifyHotPatchingComplete
        
    End If
    
    'Core program updates are handled specially, so their resources can be freed without question.
    asyncDownloader.FreeResourcesForItem "PROGRAM_UPDATE_CHECK"
    asyncDownloader.FreeResourcesForItem "PROGRAM_UPDATE_CHECK_USER"
    'asyncDownloader.Reset
    
    FormMain.mainCanvas(0).SetNetworkState False
    Debug.Print "All downloads complete."
    
End Sub

'When an asynchronous download completes, deal with it here
Private Sub asyncDownloader_FinishedOneItem(ByVal downloadSuccessful As Boolean, ByVal entryKey As String, ByVal OptionalType As Long, downloadedData() As Byte, ByVal savedToThisFile As String)
    
    'On a typical PD install, updates are checked every session, but users can specify a larger interval in the preferences dialog.
    ' As part of honoring that preference, whenever an update check successfully completes, we write the current date out to the
    ' preferences file, so subsequent runs can limit their check frequency accordingly.
    If (StrComp(entryKey, "PROGRAM_UPDATE_CHECK") = 0) Or (StrComp(entryKey, "PROGRAM_UPDATE_CHECK_USER") = 0) Then
        
        If downloadSuccessful Then
        
            'The update file downloaded correctly.  Write today's date to the master preferences file, so we can correctly calculate
            ' weekly/monthly update checks for users that require it.
            Debug.Print "Update file download complete.  Update information has been saved at " & savedToThisFile
            g_UserPreferences.SetPref_String "Updates", "Last Update Check", Format$(Now, "Medium Date")
            
            'Retrieve the file contents into a string
            Dim updateXML As String
            updateXML = StrConv(downloadedData, vbUnicode)
            
            'Offload the rest of the check to a separate update function.  It will initiate subsequent downloads as necessary.
            Dim updateAvailable As Boolean
            updateAvailable = Update_Support.ProcessProgramUpdateFile(updateXML)
            
            'If the user initiated the download, display a modal notification now
            If (StrComp(entryKey, "PROGRAM_UPDATE_CHECK_USER") = 0) Then
                
                If updateAvailable Then
                    Message "A new version of PhotoDemon is available.  The update is automatically processing in the background..."
                Else
                    Message "This copy of PhotoDemon is up to date."
                End If
                
                'Perform a low-risk yield to events, so the status bar message has time to repaint itself before the message box appears
                DoEvents
                
                If updateAvailable Then
                    PDMsgBox "A new version of PhotoDemon is available!" & vbCrLf & vbCrLf & "The update is automatically processing in the background.  You will receive a new notification when it completes.", vbOKOnly + vbInformation + vbApplicationModal, "PhotoDemon Updates", App.Major, App.Minor, App.Revision
                Else
                    PDMsgBox "This copy of PhotoDemon is the newest version available." & vbCrLf & vbCrLf & "(Current version: %1.%2.%3)", vbOKOnly + vbInformation + vbApplicationModal, "PhotoDemon Updates", App.Major, App.Minor, App.Revision
                End If
                
                'If the update managed to download while the reader was staring at the message box, display the restart notification immediately
                If g_ShowUpdateNotification Then Update_Support.DisplayUpdateNotification
                
            End If
            
        Else
            Debug.Print "Update file was not downloaded.  asyncDownloader returned this error message: " & asyncDownloader.GetLastErrorNumber & " - " & asyncDownloader.GetLastErrorDescription
        End If
    
    'Separate from the core program, we also check language file updates (if preferences allow).
    ElseIf (StrComp(entryKey, "LANGUAGE_UPDATE_CHECK") = 0) Then
    
        'Because we can live-update languages, we don't save the language update code to a file.  Instead, we retrieve its contents directly.
        Dim langUpdateXML As String
        langUpdateXML = StrConv(downloadedData, vbUnicode)
        
        'Offload the rest of the check to a separate function.  It will initiate subsequent downloads as necessary.
        Update_Support.ProcessLanguageUpdateFile langUpdateXML
    
    'If LANGUAGE_UPDATE_CHECK (above) finds out-of-date language files, it will trigger their download.  When such a download arrives, we can patch
    ' it through immediately.
    ElseIf (OptionalType = PD_LANG_IDENTIFIER) Then
        
        'Make sure the downloader thought the download was successful...
        If downloadSuccessful Then
            If Update_Support.PatchLanguageFile(entryKey, downloadedData, savedToThisFile) Then
                
                'Note that one or more language files has been patched.  If this value is true and all updates have completed, we'll hot-patch
                ' the language engine on the next PD Processor call.
                m_LanguagesUpdatedSuccessfully = True
                Debug.Print "Successfully patched " & GetFilenameWithoutExtension(savedToThisFile) & ".xml."
                
            Else
                Debug.Print "Patching of " & GetFilename(savedToThisFile) & " was unsuccessful."
            End If
        Else
            Debug.Print "WARNING! A language file download was interrupted.  Further patches will be postponed until next session."
        End If
    
    'If PROGRAM_UPDATE_CHECK (above) finds updated program or plugin files, it will trigger their download.  When the download arrives,
    ' we can start patching immediately.
    ElseIf (OptionalType = PD_PATCH_IDENTIFIER) Then
        
        If downloadSuccessful Then
            
            'Notify the software updater that an update package was downloaded successfully.  It will make a note of this, so it can
            ' complete the actual patching when PD closes.
            Update_Support.NotifyUpdatePackageAvailable savedToThisFile
            
            'Display a notification to the user
            Update_Support.DisplayUpdateNotification
                        
        Else
            Debug.Print "WARNING!  A program update was found, but the download was interrupted.  PD is postponing further patches until a later session."
        End If
        
    End If

End Sub

'External functions can request asynchronous downloads via this function.
Public Function RequestAsynchronousDownload(ByVal downloadKey As String, ByVal urlString As String, Optional ByVal OptionalDownloadType As Long = 0, Optional ByVal asyncFlags As AsyncReadConstants = vbAsyncReadResynchronize, Optional ByVal startDownloadImmediately As Boolean = False, Optional ByVal saveToThisFileWhenComplete As String = "", Optional ByVal checksumToVerify As Long = 0) As Boolean
    FormMain.mainCanvas(0).SetNetworkState True
    RequestAsynchronousDownload = Me.asyncDownloader.AddToQueue(downloadKey, urlString, OptionalDownloadType, asyncFlags, startDownloadImmediately, saveToThisFileWhenComplete, checksumToVerify)
End Function

'External functions can use this to initiate any pending downloads (e.g. downloads they may have added via requestAsynchronousDownload, above)
Public Sub TriggerPendingAsynchronousDownloads()
    FormMain.mainCanvas(0).SetNetworkState True
    Me.asyncDownloader.SetAutoDownloadMode True
End Sub

'When the main form is resized, we must re-align the main canvas to match
Private Sub Form_Resize()
    If Not (g_WindowManager Is Nothing) Then
        If g_WindowManager.GetAutoRefreshMode Then UpdateMainLayout
    Else
        UpdateMainLayout
    End If
End Sub

'Resize all currently active canvases.  This was an important function back when PD used an MDI engine, but now that we
' use our own tabbed interface, it's due for a major revisit.  If we could kill this function entirely, I'd be very happy.
Public Sub UpdateMainLayout()

    'If the main form has been minimized, don't refresh anything
    If (FormMain.WindowState = vbMinimized) Then Exit Sub
    
    'As of 7.0, a new, lightweight toolbox manager can calculate idealized window positions for us.
    Dim mainRect As winRect, canvasRect As winRect
    g_WindowManager.GetClientWinRect FormMain.hWnd, mainRect
    Toolboxes.CalculateNewToolboxRects mainRect, canvasRect
    
    'With toolbox positions successfully calculated, we can now synchronize each toolbox to its calculated rect.
    Toolboxes.PositionToolbox PDT_LeftToolbox, toolbar_Toolbox.hWnd, FormMain.hWnd
    Toolboxes.PositionToolbox PDT_RightToolbox, toolbar_Layers.hWnd, FormMain.hWnd
    Toolboxes.PositionToolbox PDT_BottomToolbox, toolbar_Options.hWnd, FormMain.hWnd
    
    'Similarly, we can drop the canvas into place using the helpful rect provided by the toolbox module.
    ' Note that resizing the canvas rect will automatically trigger a redraw of the viewport, as necessary.
    With canvasRect
        FormMain.mainCanvas(0).SetPositionAndSize .x1, .y1, .x2 - .x1, .y2 - .y1
    End With
    
    'If all three toolboxes are hidden, Windows may try to hide the main window as well.  Reset focus manually.
    If Toolboxes.AreAllToolboxesHidden Then g_WindowManager.SetFocusAPI FormMain.hWnd
    
End Sub

'Menu: Adjustments -> Photography
Private Sub MnuAdjustmentsPhoto_Click(Index As Integer)

    Select Case Index
    
        'Exposure
        Case 0
            Process "Exposure", True
        
        'HDR
        Case 1
            Process "HDR", True
        
        'Photo filters
        Case 2
            Process "Photo filter", True
        
        'Red-eye removal
        Case 3
            Process "Red-eye removal", True
        
        'Split-toning
        Case 4
            Process "Split toning", True
    
    End Select

End Sub

Private Sub MnuAutoCorrect_Click(Index As Integer)

    Select Case Index
    
        'Color
        Case 0
            Process "Auto correct color", , , UNDO_LAYER
        
        'Contrast
        Case 1
            Process "Auto correct contrast", , , UNDO_LAYER
        
        'Lighting
        Case 2
            Process "Auto correct lighting", , , UNDO_LAYER
            
        'Shadows and highlights
        Case 3
            Process "Auto correct shadows and highlights", , , UNDO_LAYER
        
    End Select

End Sub

Private Sub MnuAutoEnhance_Click(Index As Integer)

    Select Case Index
    
        'Color
        Case 0
            Process "Auto enhance color", , , UNDO_LAYER
        
        'Contrast
        Case 1
            Process "Auto enhance contrast", , , UNDO_LAYER
        
        'Lighting
        Case 2
            Process "Auto enhance lighting", , , UNDO_LAYER
            
        'Shadows and highlights
        Case 3
            Process "Auto enhance shadows and highlights", , , UNDO_LAYER
        
    End Select
    
End Sub

Private Sub MnuBatch_Click(Index As Integer)
    
    Select Case Index
    
        Case 0
            Process "Batch wizard", True
        
        Case 1
            ShowPDDialog vbModal, FormBatchRepair
        
    End Select
    
End Sub

Private Sub mnuClearRecentMacros_Click()
    g_RecentMacros.MRU_ClearList
End Sub

'The Developer Tools menu is automatically hidden in production builds, so (obviously) do not put anything here that end-users might want access to.
Private Sub mnuDevelopers_Click(Index As Integer)
    
    Dim themeRefreshRequired As Boolean: themeRefreshRequired = False
    
    Select Case Index
    
        'Theme Editor
        Case 0
            ShowPDDialog vbModal, FormThemeEditor
            
        '(separator)
        Case 1
        
        'Light/dark themes
        Case 2
            g_Themer.SetNewTheme PDTC_Light, g_Themer.GetCurrentThemeAccent, True
            themeRefreshRequired = True
        
        Case 3
            g_Themer.SetNewTheme PDTC_Dark, g_Themer.GetCurrentThemeAccent, True
            themeRefreshRequired = True
        
        '(separator)
        Case 4
        
        'Accent colors
        Case 5
            g_Themer.SetNewTheme g_Themer.GetCurrentThemeClass, PDTA_Blue, True
            themeRefreshRequired = True
        
        Case 6
            g_Themer.SetNewTheme g_Themer.GetCurrentThemeClass, PDTA_Green, True
            themeRefreshRequired = True
        
        Case 7
            g_Themer.SetNewTheme g_Themer.GetCurrentThemeClass, PDTA_Purple, True
            themeRefreshRequired = True
    
    End Select
    
    If themeRefreshRequired Then
        g_Themer.LoadDefaultPDTheme
        g_Resources.NotifyThemeChange
        Interface.RedrawEntireUI
    End If

End Sub

'Menu: effect > transform actions
Private Sub MnuEffectTransform_Click(Index As Integer)

    Select Case Index
    
        'Pan and zoom
        Case 0
            Process "Pan and zoom", True
            
        'Perspective (free)
        Case 1
            Process "Perspective", True
        
        'Polar conversion
        Case 2
            Process "Polar conversion", True
            
        'Rotate
        Case 3
            Process "Rotate", True
        
        'Shear
        Case 4
            Process "Shear", True
            
        'Spherize
        Case 5
            Process "Spherize", True
        
    End Select

End Sub

'Menu: top-level layer actions
Private Sub MnuLayer_Click(Index As Integer)

    Select Case Index
    
        'Add layer (top-level)
        Case 0
        
        'Delete layer (top-level)
        Case 1
        
        '<separator>
        Case 2
        
        'Merge up
        Case 3
            Process "Merge layer up", False, BuildParams(pdImages(g_CurrentImage).GetActiveLayerIndex), UNDO_IMAGE
        
        'Merge down
        Case 4
            Process "Merge layer down", False, BuildParams(pdImages(g_CurrentImage).GetActiveLayerIndex), UNDO_IMAGE
        
        'Order (top-level)
        Case 5
        
        '<separator>
        Case 6
        
        'Orientation (top-level)
        Case 7
        
        'Size (top-level)
        Case 8
        
        'Crop to selection
        Case 9
            Process "Crop layer to selection", , , UNDO_LAYER
        
        '<separator>
        Case 10
        
        'Transparency (top-level)
        Case 11
        
        '<separator>
        Case 12
        
        'Rasterize (top-level)
        Case 13
        
        '<separator>
        Case 14
        
        'Flatten layers
        Case 15
            Process "Flatten image", True
        
        'Merge visible layers
        Case 16
            Process "Merge visible layers", , , UNDO_IMAGE
        
    End Select

End Sub

'Menu: remove layers from the image
Private Sub MnuLayerDelete_Click(Index As Integer)

    Select Case Index
    
        'Delete current layer
        Case 0
            Process "Delete layer", False, BuildParams(pdImages(g_CurrentImage).GetActiveLayerIndex), UNDO_IMAGE_VECTORSAFE
        
        'Delete all hidden layers
        Case 1
            Process "Delete hidden layers", False, , UNDO_IMAGE_VECTORSAFE
        
    End Select

End Sub

'Menu: add a layer to the image
Private Sub MnuLayerNew_Click(Index As Integer)

    Select Case Index
    
        'Blank layer
        Case 0
            Process "Add blank layer", False, Str(pdImages(g_CurrentImage).GetActiveLayerIndex), UNDO_IMAGE_VECTORSAFE
        
        'Duplicate of current layer
        Case 1
            Process "Duplicate Layer", False, Str(pdImages(g_CurrentImage).GetActiveLayerIndex), UNDO_IMAGE_VECTORSAFE
        
        '<separator>
        Case 2
        
        'Import from clipboard
        Case 3
            Process "Paste as new layer", False, , UNDO_IMAGE_VECTORSAFE, , False
        
        'Import from file
        Case 4
            Process "New layer from file", True
    
    End Select

End Sub

'Menu: change layer order
Private Sub MnuLayerOrder_Click(Index As Integer)

    Select Case Index
    
        'Raise layer
        Case 0
            Process "Raise layer", False, Str(pdImages(g_CurrentImage).GetActiveLayerIndex), UNDO_IMAGEHEADER
        
        'Lower layer
        Case 1
            Process "Lower layer", False, Str(pdImages(g_CurrentImage).GetActiveLayerIndex), UNDO_IMAGEHEADER
        
        '<separator>
        Case 2
        
        'Raise to top
        Case 3
            Process "Raise layer to top", False, Str(pdImages(g_CurrentImage).GetActiveLayerIndex), UNDO_IMAGEHEADER
        
        'Lower to bottom
        Case 4
            Process "Lower layer to bottom", False, Str(pdImages(g_CurrentImage).GetActiveLayerIndex), UNDO_IMAGEHEADER
        
    End Select

End Sub

Private Sub MnuLayerOrientation_Click(Index As Integer)

    Select Case Index
    
        'Straighten
        Case 0
            Process "Straighten layer", True
        
        '<separator>
        Case 1
        
        'Rotate 90
        Case 2
            Process "Rotate layer 90 clockwise", , , UNDO_LAYER
        
        'Rotate 270
        Case 3
            Process "Rotate layer 90 counter-clockwise", , , UNDO_LAYER
        
        'Rotate 180
        Case 4
            Process "Rotate layer 180", , , UNDO_LAYER
        
        'Rotate arbitrary
        Case 5
            Process "Arbitrary layer rotation", True
        
        '<separator>
        Case 6
        
        'Flip horizontal
        Case 7
            Process "Flip layer horizontally", , , UNDO_LAYER
        
        'Flip vertical
        Case 8
            Process "Flip layer vertically", , , UNDO_LAYER
    
    End Select

End Sub

Private Sub MnuLayerRasterize_Click(Index As Integer)
    
    Select Case Index
    
        'Current layer
        Case 0
            Process "Rasterize layer", , , UNDO_LAYER
            
        'All layers
        Case 1
            Process "Rasterize all layers", , , UNDO_IMAGE
            
    End Select
    
End Sub

Private Sub MnuLayerSize_Click(Index As Integer)

    Select Case Index
    
        'Reset to actual size
        Case 0
            Process "Reset layer size", False, BuildParams(pdImages(g_CurrentImage).GetActiveLayerIndex), UNDO_LAYERHEADER
        
        '<separator>
        Case 1
            
        'Standard resize
        Case 2
            Process "Resize layer", True
        
        'Content-aware resize
        Case 3
            Process "Content-aware layer resize", True
    
    End Select

End Sub

'Light and shadow effect menu
Private Sub MnuLightShadow_Click(Index As Integer)

    Select Case Index
    
        'Black light
        Case 0
            Process "Black light", True
        
        'Cross-screen (stars)
        Case 1
            Process "Cross-screen", True
        
        'Lens flare
        Case 2
            Process "Lens flare", True
        
        'Rainbow
        Case 3
            Process "Rainbow", True
            
        'Sunshine
        Case 4
            Process "Sunshine", True
        
        '<separator>
        Case 5
        
        'Dilate (maximum rank)
        Case 6
            Process "Dilate (maximum rank)", True
        
        'Erode (minimum rank)
        Case 7
            Process "Erode (minimum rank)", True
        
    
    End Select

End Sub

Private Sub MnuNatureTest_Click()
    'showPDDialog vbModal, FormFreeze2
End Sub

Private Sub MnuPixelate_Click(Index As Integer)
    
    Select Case Index
    
        'Color halftone
        Case 0
            Process "Color halftone", True
            
        'Crystallize
        Case 1
            Process "Crystallize", True
        
        'Fragment
        Case 2
            Process "Fragment", True
            
        'Mezzotint
        Case 3
            Process "Mezzotint", True
            
        'Mosaic (pixelate)
        Case 4
            Process "Mosaic", True
        
    End Select
    
End Sub

Private Sub mnuRecentMacros_Click(Index As Integer)
    'Load the MRU Macro path that correlates to this index.  (If one is not found, a null string is returned)
    Dim tmpString As String
    tmpString = g_RecentMacros.getSpecificMRU(Index)
    
    'Check - just in case - to make sure the path isn't empty
    If tmpString <> "" Then
        
        ' Play the macro
        Macro_Interface.PlayMacroFromFile tmpString
        
    End If
End Sub

Private Sub MnuRecordMacro_Click(Index As Integer)
    
    Select Case Index
    
        'Start recording
        Case 0
            Process "Start macro recording", , , UNDO_NOTHING
        
        'Stop recording
        Case 1
            Process "Stop macro recording", True
        
    End Select
    
End Sub

Private Sub MnuWindowToolbox_Click(Index As Integer)
    
    Select Case Index
    
        'Toggle toolbox visibility
        Case 0
            ToggleToolboxVisibility PDT_LeftToolbox
        
        '<separator>
        Case 1
        
        'Toggle category labels
        Case 2
            toolbar_Toolbox.ToggleToolCategoryLabels
        
        '<separator>
        Case 3
        
        'Changes to button size (small, normal, large)
        Case 4, 5, 6
            toolbar_Toolbox.UpdateButtonSize Index - 4
            
    End Select
    
End Sub

Private Sub pdHotkeys_Accelerator(ByVal acceleratorIndex As Long)
    
    'Accelerators are divided into three groups, and they are processed in the following order:
    ' 1) Direct processor strings.  These are automatically submitted to the software processor.
    ' 2) Non-processor directives that can be fired if no images are present (e.g. Open, Paste)
    ' 3) Non-processor directives that require an image.

    '***********************************************************
    'Accelerators that are direct processor strings are handled automatically
    
    With pdHotkeys
    
        If .IsProcessorString(acceleratorIndex) Then
            
            'If the action requires an open image, check for that first
            If .IsImageRequired(acceleratorIndex) Then
                If (g_OpenImageCount = 0) Then Exit Sub
                If Not (FormLanguageEditor Is Nothing) Then
                    If FormLanguageEditor.Visible Then Exit Sub
                End If
            End If
            
            'If this action is associated with a menu, make sure that corresponding menu is enabled
            If (.HasMenu(acceleratorIndex)) Then
                If (Not (.MenuReference(acceleratorIndex) Is Nothing)) Then
                    If (Not .MenuReference(acceleratorIndex).Enabled) Then Exit Sub
                End If
            End If
            
            Process .HotKeyName(acceleratorIndex), .IsDialogDisplayed(acceleratorIndex), , .ProcUndoValue(acceleratorIndex)
            Exit Sub
            
        End If
    
        '***********************************************************
        'This block of code holds:
        ' - Accelerators that DO NOT require at least one loaded image
        
        If .HotKeyName(acceleratorIndex) = "Preferences" Then
            If Not FormPreferences.Visible Then
                ShowPDDialog vbModal, FormPreferences
                Exit Sub
            End If
        End If
        
        If .HotKeyName(acceleratorIndex) = "Plugin manager" Then
            If Not FormPluginManager.Visible Then
                ShowPDDialog vbModal, FormPluginManager
                Exit Sub
            End If
        End If
        
        'MRU files
        Dim i As Integer
        For i = 0 To 9
            If .HotKeyName(acceleratorIndex) = ("MRU_" & i) Then
                If FormMain.mnuRecDocs.Count > i Then
                    If FormMain.mnuRecDocs(i).Enabled Then
                        Call FormMain.mnuRecDocs_Click(i)
                        Exit Sub
                    End If
                End If
            End If
        Next i
        
        '***********************************************************
        'This block of code holds:
        ' - Accelerators that DO require at least one loaded image
        
        'If no images are loaded, exit immediately
        If (g_OpenImageCount = 0) Then Exit Sub
        
        'Fit on screen
        If .HotKeyName(acceleratorIndex) = "FitOnScreen" Then FitOnScreen
        
        'Zoom in
        If .HotKeyName(acceleratorIndex) = "Zoom_In" Then
            Call MnuZoomIn_Click
        End If
        
        'Zoom out
        If .HotKeyName(acceleratorIndex) = "Zoom_Out" Then
            Call MnuZoomOut_Click
        End If
        
        'Actual size
        If .HotKeyName(acceleratorIndex) = "Actual_Size" Then
            If FormMain.mainCanvas(0).IsZoomEnabled Then FormMain.mainCanvas(0).SetZoomDropDownIndex g_Zoom.GetZoom100Index
        End If
        
        'Various zoom values
        If .HotKeyName(acceleratorIndex) = "Zoom_161" Then
            If FormMain.mainCanvas(0).IsZoomEnabled Then FormMain.mainCanvas(0).SetZoomDropDownIndex 2
        End If
        
        If .HotKeyName(acceleratorIndex) = "Zoom_81" Then
            If FormMain.mainCanvas(0).IsZoomEnabled Then FormMain.mainCanvas(0).SetZoomDropDownIndex 4
        End If
        
        If .HotKeyName(acceleratorIndex) = "Zoom_41" Then
            If FormMain.mainCanvas(0).IsZoomEnabled Then FormMain.mainCanvas(0).SetZoomDropDownIndex 8
        End If
        
        If .HotKeyName(acceleratorIndex) = "Zoom_21" Then
            If FormMain.mainCanvas(0).IsZoomEnabled Then FormMain.mainCanvas(0).SetZoomDropDownIndex 10
        End If
        
        If .HotKeyName(acceleratorIndex) = "Zoom_12" Then
            If FormMain.mainCanvas(0).IsZoomEnabled Then FormMain.mainCanvas(0).SetZoomDropDownIndex 14
        End If
        
        If .HotKeyName(acceleratorIndex) = "Zoom_14" Then
            If FormMain.mainCanvas(0).IsZoomEnabled Then FormMain.mainCanvas(0).SetZoomDropDownIndex 16
        End If
        
        If .HotKeyName(acceleratorIndex) = "Zoom_18" Then
            If FormMain.mainCanvas(0).IsZoomEnabled Then FormMain.mainCanvas(0).SetZoomDropDownIndex 19
        End If
        
        If .HotKeyName(acceleratorIndex) = "Zoom_116" Then
            If FormMain.mainCanvas(0).IsZoomEnabled Then FormMain.mainCanvas(0).SetZoomDropDownIndex 21
        End If
        
        'Remove selection
        If .HotKeyName(acceleratorIndex) = "Remove selection" Then
            Process "Remove selection", , , UNDO_SELECTION
        End If
        
        'Next / Previous image hotkeys ("Page Down" and "Page Up", respectively)
        If .HotKeyName(acceleratorIndex) = "Next_Image" Then MoveToNextChildWindow True
        If .HotKeyName(acceleratorIndex) = "Prev_Image" Then MoveToNextChildWindow False
    
    End With
        
End Sub

Private Sub shellPipeMain_ErrDataArrival(ByVal CharsTotal As Long)

    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "WARNING!  FormMain's asynchronous shellPipeMain source returned the following data on stderr: "
        pdDebug.LogAction shellPipeMain.ErrGetData()
    #End If
    
End Sub

'Append any new data to our master metadata string
Private Sub shellPipeMain_DataArrival(ByVal CharsTotal As Long)
    
    Dim receivedData As String
    receivedData = shellPipeMain.GetData()
    
    If Len(receivedData) <> 0 Then
    
        NewMetadataReceived receivedData
    
        'DEBUG ONLY!
        #If DEBUGMODE = 1 Then
            pdDebug.LogAction "Asynchronously received " & LenB(receivedData) & " bytes of new data from ExifTool."
        #End If
        
    End If
    
End Sub

'Countdown timer for re-enabling disabled user input.  A delay is enforced to prevent double-clicks on child dialogs from
' "passing through" to the main form and causing goofy behavior.
Private Sub tmrCountdown_Timer()

    Static intervalCount As Long
    
    If (intervalCount > 2) Then
        intervalCount = 0
        g_DisableUserInput = False
        tmrCountdown.Enabled = False
    End If
    
    intervalCount = intervalCount + 1

End Sub

'This metadata timer is a final failsafe for images with huge metadata collections that take a long time to parse.  If an image has successfully
' loaded but its metadata parsing is still in-progress, PD's load function will activate this timer.  The timer will wait (asynchronously) for
' metadata parsing to finish, and when it does, it will copy the metadata into the active pdImage object, then disable itself.
Private Sub tmrMetadata_Timer()
    
    'I don't like resorting to this hackneyed solution, but ExifTool can sometimes be unpredictable, especially if the user loads a bajillion
    ' images simultaneously.  Rather than bring down the whole program, I'd prefer to simply ignore metadata for the problematic image.
    On Error Resume Next

    If ExifTool.IsMetadataFinished Then
    
        'Start by disabling this timer, lest it fire again while we're in the middle of parsing stuff
        tmrMetadata.Enabled = False
    
        'Cache the current message (if any)
        Dim prevMessage As String
        prevMessage = g_LastPostedMessage
                
        Message "Asynchronous metadata check complete!  Updating metadata collection..."
        
        'Retrieve the completed metadata string
        Dim mdString As String, tmpString As String
        mdString = RetrieveMetadataString()
        
        Dim curImageID As Long
        
        'Now comes some messy string parsing.  If the user has loaded multiple images at once, the metadata string returned by ExifTool will contain
        ' ALL METADATA for ALL IMAGES in one giant string.  We need to parse out each image's metadata, supply it to the correct image, then repeat
        ' until all images have received their relevant metadata.
        
        'Start by finding the first occurrence of ExifTool's unique "{ready}" message, which signifies its success in completing a single coherent
        ' -execute request.
        Dim startPosition As Long, terminalPosition As Long
        startPosition = 1
        terminalPosition = InStr(1, mdString, "{ready", vbBinaryCompare)
        
        Do While (terminalPosition <> 0)
        
            'terminalPosition now contains the position of ExifTool's "{ready123}" tag, where 123 is the ID of the image whose metadata
            ' is contained prior to that point.  Start by figuring out what that ID number actually is.
            Dim lenFailsafe As Long
            
            If terminalPosition + 6 < Len(mdString) Then
                lenFailsafe = InStr(terminalPosition + 6, mdString, "}", vbBinaryCompare) - (terminalPosition + 6)
            Else
                lenFailsafe = 0
            End If
            
            If lenFailsafe <> 0 Then
                
                'Attempt to retrieve the relevant image ID for this section of metadata
                If (terminalPosition + 6 + lenFailsafe) < Len(mdString) Then
                
                    tmpString = Mid$(mdString, terminalPosition + 6, lenFailsafe)
                    
                    If IsNumeric(tmpString) Then
                        curImageID = CLng(tmpString)
                    'Else
                        'Debug.Print "Metadata ID calculation invalid - was ExifTool updated? - " & tmpString
                    End If
                    
                    'Now we know where the metadata for this image *ends*, but we still need to find where it *starts*.  All metadata XML entries start with
                    ' a standard XML header.  Search backwards from the {ready123} message until such a header is found.
                    startPosition = InStrRev(mdString, "<?xml", terminalPosition, vbBinaryCompare)
                    
                    'Using the start and final markers, extract the relevant metadata and forward it to the relevant pdImage object
                    If (startPosition > 0) And ((terminalPosition - startPosition) > 0) Then
                        
                        'Make sure we calculated our curImageID value correctly
                        If (curImageID >= 0) And (curImageID <= UBound(pdImages)) Then
                            If Not pdImages(curImageID) Is Nothing Then
                            
                                'Create the imgMetadata object as necessary, and load the selected metadata into it!
                                If pdImages(curImageID).imgMetadata Is Nothing Then Set pdImages(curImageID).imgMetadata = New pdMetadata
                                pdImages(curImageID).imgMetadata.LoadAllMetadata Mid$(mdString, startPosition, terminalPosition - startPosition), curImageID
                                
                            End If
                        End If
                        
                        'Find the next chunk of image metadata, if any
                        terminalPosition = InStr(terminalPosition + 6, mdString, "{ready", vbBinaryCompare)
                        
                    Else
                        Debug.Print "(startPosition > 0) And ((terminalPosition - startPosition) > 0) failed"
                        terminalPosition = 0
                    End If
                                        
                Else
                    Debug.Print "(terminalPosition + 6 + lenFailsafe) was greater than Len(mdString)"
                    terminalPosition = 0
                End If
                
            Else
                Debug.Print "lenFailsafe = 0"
                terminalPosition = 0
            End If
        
        Loop
        
        'Update the interface to match the active image.  (This must be done if things like GPS tags were found in the metadata,
        ' because their presence affects the enabling of certain metadata-related menu entries.)
        SyncInterfaceToCurrentImage
        
        'Restore the original on-screen message and exit
        Message prevMessage
        
    End If

End Sub


'THE BEGINNING OF EVERYTHING
' Actually, Sub "Main" in the module "MainModule" is loaded first, but all it does is set up native theming.  Once it has done that, FormMain is loaded.
Private Sub Form_Load()
    
    On Error GoTo FormMainLoadError
    
    '*************************************************************************************************************************************
    ' Start by rerouting control to "LoadTheProgram", which initializes all key PD systems
    '*************************************************************************************************************************************
    
    'The bulk of the loading code actually takes place inside the main module's ContinueLoadingProgram() function
    MainModule.ContinueLoadingProgram
    
    
    '*************************************************************************************************************************************
    ' Now that all program engines are initialized, we can finally display the primary window
    '*************************************************************************************************************************************
    
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Registering toolbars with the window manager..."
    #End If
    
    'Now that the main form has been correctly positioned on-screen, position all toolbars and the primary canvas
    ' to match, then display the window.
    g_WindowManager.SetAutoRefreshMode True
    FormMain.UpdateMainLayout
    g_WindowManager.SetAutoRefreshMode False
    
    'DWM may cause issues inside the IDE, so forcibly refresh the main form after displaying it.
    ' (The DoEvents fixes an unpleasant flickering issue on Windows Vista/7 when the DWM isn't running full Aero.)
    FormMain.Show vbModeless
    FormMain.Refresh
    DoEvents
    
    'Visibility for the options toolbox is automatically set according to the current tool; this is different from other dialogs.
    ' (Note that the .ResetToolButtonStates function checks the relevant preference prior to changing the window state, so all
    '  cases are covered nicely.)
    toolbar_Toolbox.ResetToolButtonStates
    
    'With all toolboxes loaded, we can safely reactivate automatic syncing of toolboxes and the main window
    g_WindowManager.SetAutoRefreshMode True
    
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Preparing input tracker..."
    #End If
    
    
    '*************************************************************************************************************************************
    ' Next, make sure PD's previous session closed down successfully
    '*************************************************************************************************************************************
    
    Message "Checking for old autosave data..."
    Autosave_Handler.InitializeAutosave
    
    
    '*************************************************************************************************************************************
    ' Next, analyze the command line and load any image files (if present).
    '*************************************************************************************************************************************
    
    Message "Checking command line..."
    
    If (Len(g_CommandLine) <> 0) Then
        
        #If DEBUGMODE = 1 Then
            pdDebug.LogAction "Command line might contain images.  Here's what I found:"
            pdDebug.LogAction g_CommandLine
        #End If
        
        Message "Loading requested images..."
        Loading.LoadImagesFromCommandLine
        
    End If
        
    '*************************************************************************************************************************************
    ' Next, see if we need to display the language selection dialog (NOT IMPLEMENTED AT PRESENT)
    '*************************************************************************************************************************************
    
    'Before continuing with the last few steps of interface initialization, we need to make sure the user is being presented
    ' with an interface they can understand - thus we need to evaluate the current language and make changes as necessary.
    
    'Start by asking the translation engine if it thinks we should display a language dialog.  (The conditions that trigger
    ' this are described in great detail in the pdTranslate class.)
    Dim lDialogReason As Long
    If g_Language.IsLanguageDialogNeeded(lDialogReason) Then
    
        'If we are inside this block, the translation engine thinks we should ask the user to pick a language.  The reason
        ' for this is stored in the lDialogReason variable, and the values correspond to the following:
        ' 0) User-initiated dialog (irrelevant in this case; the return should never be 0)
        ' 1) First-time user, and an approximate (but not exact) language match was found.  Ask them to clarify.
        ' 2) First-time user, and no language match found.  Give them a language dialog in English.
        ' 3) Not a first-time user, but the preferred language file couldn't be located.  Ask them to pick a new one.
        
    
    End If
    
    
    '*************************************************************************************************************************************
    ' Next, see if we need to launch an asynchronous check for updates
    '*************************************************************************************************************************************
        
    'See if this PD session was initiated by a PD-generated restart.  This happens after an update patch is successfully applied, for example.
    g_ProgramStartedViaRestart = Update_Support.WasProgramStartedViaRestart
        
    'Before updating, clear out any temp files leftover from previous updates.  (Replacing files at run-time is messy business, and Windows
    ' is unpredictable about allowing replaced files to be deleted.)
    Update_Support.CleanPreviousUpdateFiles
        
    'Start by seeing if we're allowed to check for software updates (the user can disable this check, and we want to honor their selection)
    Dim allowedToUpdate As Boolean
    allowedToUpdate = Update_Support.IsItTimeForAnUpdate()
    
    'If PD was restarted by an internal restart, disallow an update check now, as we would have just applied one (which caused the restart)
    If g_ProgramStartedViaRestart Then allowedToUpdate = False
    
    'If this is the user's first time using the program, don't pester them with update notifications
    If g_IsFirstRun Then allowedToUpdate = False
    
    'If we're STILL allowed to update, do so now (unless this is the first time the user has run the program; in that case, suspend updates,
    ' as it is assumed the user already has an updated copy of the software - and we don't want to bother them already!)
    If allowedToUpdate Then
    
        Message "Initializing software updater (this feature can be disabled from the Tools -> Options menu)..."
        
        'Initiate an asynchronous download of the standard PD update file (photodemon.org/downloads/updates.xml).
        ' When the asynchronous download completes, the downloader will place the completed update file in the /Data/Updates subfolder.
        ' On exit (or subsequent program runs), PD will check for the presence of that file, then proceed accordingly.
        Me.asyncDownloader.AddToQueue "PROGRAM_UPDATE_CHECK", "http://photodemon.org/downloads/updates/pdupdate.xml", , vbAsyncReadForceUpdate, False, g_UserPreferences.GetUpdatePath & "updates.xml"
        
        'As of v6.6, PhotoDemon now supports independent language file updates, separate from updating PD as a whole.
        ' Check that preference, and if allowed, initiate a separate language file check.  (If no core program update is found, but a language
        ' file update *is* found, we'll download and patch those separately.)
        If g_UserPreferences.GetPref_Boolean("Updates", "Update Languages Independently", True) Then
            Me.asyncDownloader.AddToQueue "LANGUAGE_UPDATE_CHECK", "http://photodemon.org/downloads/updates/langupdate.xml"
        End If
        
        'As of v6.6, PhotoDemon also supports independent plugin file updates, separate from updating PD as a whole.
        ' Check that preference, and if allowed, initiate a separate plugin file check.  (If no core program update is found, but a plugin
        ' file update *is* found, we'll download and patch those separately.)
        If g_UserPreferences.GetPref_Boolean("Updates", "Update Plugins Independently", True) Then
            'TODO!
        End If
        
    End If
    
    'With all potentially required downloads added to the queue, we can now begin downloading everything
    Me.asyncDownloader.SetAutoDownloadMode True
    
    
    '*************************************************************************************************************************************
    ' Display any final messages and/or warnings
    '*************************************************************************************************************************************
    
    Message ""
    g_UserPreferences.EndBatchPreferenceMode
    FormMain.Refresh
    DoEvents
    
    'I occasionally add dire messages to nightly builds.  The line below is the best place to enable that, as necessary.
    'PDMsgBox "WARNING!  I am currently overhauling PhotoDemon's image export capabilities.  Because this work impacts the reliability of the File > Save and File > Save As commands, I DO NOT RECOMMEND using this build for serious work." & vbCrLf & vbCrLf & "(Seriously: please do any serious editing with with the last stable release, available from photodemon.org)", vbExclamation + vbOKOnly + vbApplicationModal, "7.0 Development Warning"
    
    
    '*************************************************************************************************************************************
    ' For developers only, calculate some debug counts and show an IDE avoidance warning (if it hasn't been dismissed before).
    '*************************************************************************************************************************************
    
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Current PD custom control count: " & UserControl_Support.GetPDControlCount
    #End If
    
    'Because people may be using this code in the IDE, warn them about the consequences of doing so
    If (Not g_IsProgramCompiled) And (g_UserPreferences.GetPref_Boolean("Core", "Display IDE Warning", True)) Then DisplayIDEWarning
    
    'In debug mode, note that we are about to turn control over to the user
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Program initialization complete.  Second baseline memory measurement:"
        pdDebug.LogAction "", PDM_MEM_REPORT
    #End If
    
    'Finally, return focus to the main form
    g_WindowManager.SetFocusAPI FormMain.hWnd
    
    Exit Sub
    
FormMainLoadError:

    #If DEBUGMODE = 1 Then
        If (Not (pdDebug Is Nothing)) Then
            pdDebug.LogAction "WARNING!  FormMain_Load experienced an error: #" & Err.Number & ", " & Err.Description
        End If
    #End If
     
End Sub

'Allow the user to drag-and-drop files and URLs onto the main form
Private Sub Form_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)

    'Make sure the form is available (e.g. a modal form hasn't stolen focus)
    If (Not g_AllowDragAndDrop) Then Exit Sub
    
    'Use the external function (in the clipboard handler, as the code is roughly identical to clipboard pasting)
    ' to load the OLE source.
    g_Clipboard.LoadImageFromDragDrop Data, Effect, False
    
End Sub

Private Sub Form_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single, State As Integer)
    
    'PD supports a lot of potential drop sources these days.  These values are defined and addressed by the main
    ' clipboard handler, as Drag/Drop and clipboard actions share a ton of similar code.
    If g_Clipboard.IsObjectDragDroppable(Data) And g_AllowDragAndDrop Then
        Effect = vbDropEffectCopy And Effect
    Else
        Effect = vbDropEffectNone
    End If

End Sub

'If the user is attempting to close the program, run some checks.  Specifically, we want to make sure all child forms have been saved.
' Note: in VB6, the order of events for program closing is MDI Parent QueryUnload, MDI children QueryUnload, MDI children Unload, MDI Unload
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    
    'Store the main window's location to file now.  We will use this in the future to determine which monitor
    ' to display the splash screen on
    g_UserPreferences.SetPref_Long "Core", "Last Window State", Me.WindowState
    g_UserPreferences.SetPref_Long "Core", "Last Window Left", Me.Left / TwipsPerPixelXFix
    g_UserPreferences.SetPref_Long "Core", "Last Window Top", Me.Top / TwipsPerPixelYFix
    g_UserPreferences.SetPref_Long "Core", "Last Window Width", Me.Width / TwipsPerPixelXFix
    g_UserPreferences.SetPref_Long "Core", "Last Window Height", Me.Height / TwipsPerPixelYFix
    
    'Set a public variable to let other functions know that the user has initiated a program-wide shutdown
    g_ProgramShuttingDown = True
    
    'Before exiting QueryUnload, attempt to unload all open images.  If any of them cancel shutdown, postpone the
    ' program-wide shutdown as well
    Dim i As Long
    If (g_NumOfImagesLoaded > 0) Then
    
        For i = 0 To UBound(pdImages)
            If Not (pdImages(i) Is Nothing) Then
                If pdImages(i).IsActive Then
                
                    'This image is active and so is its parent form.  Ask the master image handler to unload it.
                    ' (NOTE: this function returns a boolean saying whether the image was successfully unloaded,
                    '        but for this fringe case, we ignore it in favor of checking g_ProgramShuttingDown.)
                    Image_Canvas_Handler.FullPDImageUnload i, True
                    
                    'If the child form canceled shut down, it will have reset the g_ProgramShuttingDown variable
                    If (Not g_ProgramShuttingDown) Then
                        Cancel = True
                        Exit Sub
                    End If
                    
                End If
            End If
        Next i
        
    End If
    
End Sub

'UNLOAD EVERYTHING
Private Sub Form_Unload(Cancel As Integer)
    
    'FYI, this function includes a fair amount of debug code!
    
    'Hide the main window to make it appear as if we shut down quickly
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Shutdown initiated"
        pdDebug.LogAction vbNullString, PDM_MEM_REPORT
    #End If
    
    Me.Visible = False
    Interface.ReleaseResources
    
    'Cancel any pending downloads
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Checking for (and terminating) any in-progress downloads..."
    #End If
    
    Me.asyncDownloader.Reset
    
    'Allow any objects on this form to save preferences and other user data
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Asking all FormMain components to write out final user preference values..."
    #End If
    
    FormMain.mainCanvas(0).WriteUserPreferences
    Toolboxes.SaveToolboxData
    
    'Release the clipboard manager.  If we are responsible for the current clipboard data, we must manually upload a
    ' copy of all supported formats - for this reason, this step may be a little slow.
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Shutting down clipboard manager..."
    #End If
    
    If g_Clipboard.IsPDDataOnClipboard And g_IsProgramCompiled Then
        #If DEBUGMODE = 1 Then
            pdDebug.LogAction "PD's data remains on the clipboard.  Rendering any additional formats now..."
        #End If
        g_Clipboard.RenderAllClipboardFormatsManually
    End If
    
    Set g_Clipboard = Nothing
    
    'Most core plugins are released as a final step, but ExifTool only matters when images are loaded, and we know
    ' no images are loaded by this point.  Because it takes some time to shut down, trigger it prematurely.
    If g_ExifToolEnabled Then
        ExifTool.TerminateExifTool
        #If DEBUGMODE = 1 Then
            pdDebug.LogAction "ExifTool terminated"
        #End If
    End If
    
    'Perform any printer-related cleanup
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Removing printer temp files..."
    #End If
    
    Printing.PerformPrinterCleanup
    
    'Stop tracking hotkeys
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Turning off hotkey manager..."
    #End If
    
    pdHotkeys.DeactivateHook True
    pdHotkeys.ReleaseResources
    
    'Release the tooltip tracker
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Releasing tooltip manager..."
    #End If
    
    UserControl_Support.FinalTooltipUnload
    
    'Destroy all custom-created icons and cursors
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Destroying custom icons and cursors..."
    #End If
    
    Icons_and_Cursors.DestroyAllIcons
    Icons_and_Cursors.UnloadAllCursors
    
    'Destroy all paint-related resources
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Destroying paintbrush resources..."
    #End If
    
    Paintbrush.FreeBrushResources
        
    'Save all MRU lists to the preferences file.  (I've considered doing this as files are loaded, but the only time
    ' that would be an improvement is if the program crashes, and if it does crash, the user wouldn't want to re-load
    ' the problematic image anyway.)
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Saving recent file list..."
    #End If
    
    g_RecentFiles.MRU_SaveToFile
    g_RecentMacros.MRU_SaveToFile
    
    'Restore the user's font smoothing setting as necessary.  (Only relevant on XP.)
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Performing any XP-specific shutdown tasks..."
    #End If
    
    HandleClearType False
    
    'Release any Win7-specific features
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Releasing custom Windows 7, 8, 10 features..."
    #End If
    
    ReleaseWin7Features
    
    'Tool panels are forms that we manually embed inside other forms.  Manually unload them now.
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction vbNullString, PDM_MEM_REPORT
        pdDebug.LogAction "Unloading tool panels..."
    #End If
    
    'Now that toolpanels are loaded/unloaded on-demand, we don't need to manually unload them at shutdown.
    ' Instead, just unload the *active* one (which we can infer from the active tool).
    If (g_CurrentTool = NAV_MOVE) Then
        
        g_WindowManager.DeactivateToolPanel True, toolpanel_MoveSize.hWnd
        Unload toolpanel_MoveSize
        Set toolpanel_MoveSize = Nothing
        
        #If DEBUGMODE = 1 Then
            pdDebug.LogAction vbNullString, PDM_MEM_REPORT
            pdDebug.LogAction "(above memory report is post-unload toolpanel_Movesize)"
        #End If
        
    ElseIf (g_CurrentTool = QUICK_FIX_LIGHTING) Then
    
        g_WindowManager.DeactivateToolPanel True, toolpanel_NDFX.hWnd
        Unload toolpanel_NDFX
        Set toolpanel_NDFX = Nothing
        
        #If DEBUGMODE = 1 Then
            pdDebug.LogAction vbNullString, PDM_MEM_REPORT
            pdDebug.LogAction "(above memory report is post-unload toolpanel_NDFX)"
        #End If
        
    ElseIf (g_CurrentTool = SELECT_RECT) Or (g_CurrentTool = SELECT_CIRC) Or (g_CurrentTool = SELECT_LINE) Or (g_CurrentTool = SELECT_POLYGON) Or (g_CurrentTool = SELECT_LASSO) Or (g_CurrentTool = SELECT_WAND) Then
    
        g_WindowManager.DeactivateToolPanel True, toolpanel_Selections.hWnd
        Unload toolpanel_Selections
        Set toolpanel_Selections = Nothing
        
        #If DEBUGMODE = 1 Then
            pdDebug.LogAction vbNullString, PDM_MEM_REPORT
            pdDebug.LogAction "(above memory report is post-unload toolpanel_Selections)"
        #End If
        
    ElseIf (g_CurrentTool = VECTOR_TEXT) Then
    
        g_WindowManager.DeactivateToolPanel True, toolpanel_Text.hWnd
        Unload toolpanel_Text
        Set toolpanel_Text = Nothing
        
        #If DEBUGMODE = 1 Then
            pdDebug.LogAction vbNullString, PDM_MEM_REPORT
            pdDebug.LogAction "(above memory report is post-unload toolpanel_Text)"
        #End If
        
    ElseIf (g_CurrentTool = VECTOR_FANCYTEXT) Then
    
        g_WindowManager.DeactivateToolPanel True, toolpanel_FancyText.hWnd
        Unload toolpanel_FancyText
        Set toolpanel_FancyText = Nothing
        
        #If DEBUGMODE = 1 Then
            pdDebug.LogAction vbNullString, PDM_MEM_REPORT
            pdDebug.LogAction "(above memory report is post-unload toolpanel_FancyText)"
        #End If
        
    ElseIf (g_CurrentTool = PAINT_BASICBRUSH) Then
    
        g_WindowManager.DeactivateToolPanel True, toolpanel_Pencil.hWnd
        Unload toolpanel_Pencil
        Set toolpanel_Pencil = Nothing
        
        #If DEBUGMODE = 1 Then
            pdDebug.LogAction vbNullString, PDM_MEM_REPORT
            pdDebug.LogAction "(above memory report is post-unload toolpanel_Pencil)"
        #End If
        
    ElseIf (g_CurrentTool = PAINT_SOFTBRUSH) Then
    
        g_WindowManager.DeactivateToolPanel True, toolpanel_Paintbrush.hWnd
        Unload toolpanel_Paintbrush
        Set toolpanel_Paintbrush = Nothing
        
        #If DEBUGMODE = 1 Then
            pdDebug.LogAction vbNullString, PDM_MEM_REPORT
            pdDebug.LogAction "(above memory report is post-unload toolpanel_Paintbrush)"
        #End If
        
    End If
    
    'With all tool panels unloaded, unload all toolboxes as well
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Unloading toolboxes..."
    #End If
    
    Unload toolbar_Layers
    Set toolbar_Layers = Nothing
    
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction vbNullString, PDM_MEM_REPORT
        pdDebug.LogAction "(above memory report is post-unload toolbar_Layers)"
    #End If
    
    Unload toolbar_Options
    Set toolbar_Options = Nothing
    
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction vbNullString, PDM_MEM_REPORT
        pdDebug.LogAction "(above memory report is post-unload toolbar_Options)"
    #End If
    
    Unload toolbar_Toolbox
    Set toolbar_Toolbox = Nothing
    
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction vbNullString, PDM_MEM_REPORT
        pdDebug.LogAction "(above memory report is post-unload toolbar_Toolbox)"
    #End If
    
    'Release this form from the window manager, and write out all window data to file
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Shutting down window manager..."
    #End If
    
    g_WindowManager.UnregisterForm Me
    g_WindowManager.SaveAllWindowLocations
    
    'As a final failsafe, forcibly unload any remaining forms
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Forcibly unloading any remaining forms..."
    #End If
    
    Dim tmpForm As Form
    For Each tmpForm In Forms

        'Note that there is no need to unload FormMain, as we're about to unload it anyway!
        If (StrComp(LCase$(tmpForm.Name), "formmain", vbBinaryCompare) <> 0) Then
            Debug.Print "Forcibly unloading " & tmpForm.Name
            Unload tmpForm
            Set tmpForm = Nothing
        End If

    Next tmpForm
    
    'If an update package was downloaded, this is a good time to apply it
    If Update_Support.IsUpdatePackageAvailable Then
        
        If Update_Support.PatchProgramFiles() Then
            
            #If DEBUGMODE = 1 Then
                pdDebug.LogAction "Update_Support.patchProgramFiles returned TRUE.  Program update will proceed after PD finishes unloading."
            #End If
            
            'If the user wants a restart, create a restart batch file now
            'If g_UserWantsRestart Then Update_Support.createRestartBatchFile
            
        Else
            #If DEBUGMODE = 1 Then
                pdDebug.LogAction "WARNING!  One or more errors were encountered while applying an update.  PD has attempted to roll everything back to its original state."
            #End If
        End If
        
    End If
        
    'Because PD can now auto-update between runs, it's helpful to log the current program version to the preferences file.  The next time PD runs,
    ' it can compare its version against this value, to infer if an update occurred.
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Writing session data to file..."
    #End If
    
    g_UserPreferences.SetPref_String "Core", "LastRunVersion", App.Major & "." & App.Minor & "." & App.Revision
    
    'All core PD functions appear to have terminated correctly, so notify the Autosave handler that this session was clean.
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Final step: writing out new autosave checksum..."
    #End If
    
    Autosave_Handler.PurgeOldAutosaveData
    Autosave_Handler.NotifyCleanShutdown
    
    #If DEBUGMODE = 1 Then
        pdDebug.LogAction "Shutdown appears to be clean.  Turning final control over to MainModule.FinalShutdown()..."
    #End If
    
    MainModule.FinalShutdown
    
    'If a restart is allowed, the last thing we do before exiting is shell a new PhotoDemon instance
    'If g_UserWantsRestart Then Update_Support.initiateRestart
    
End Sub

'The top-level adjustments menu provides some shortcuts to most-used items.
Private Sub MnuAdjustments_Click(Index As Integer)

    Select Case Index
    
        'Auto correct (top-level)
        Case 0
            
        'Auto enhance (top-level)
        Case 1
        
        '<separator>
        Case 2
            
        'Black and white
        Case 3
            Process "Black and white", True
        
        'Brightness and contrast
        Case 4
            Process "Brightness and contrast", True
        
        'Color balance
        Case 5
            Process "Color balance", True
        
        'Curves
        Case 6
            Process "Curves", True
        
        'Levels
        Case 7
            Process "Levels", True
        
        'Shadows and highlights
        Case 8
            Process "Shadow and highlight", True
        
        'Vibrance
        Case 9
            Process "Vibrance", True
        
        'White balance
        Case 10
            Process "White balance", True
    
    End Select

End Sub

'All artistic filters are launched here
Private Sub MnuArtistic_Click(Index As Integer)

    Select Case Index
        
        'Colored pencil
        Case 0
            Process "Colored pencil", True
        
        'Comic book
        Case 1
            Process "Comic book", True
            
        'Figured glass
        Case 2
            Process "Figured glass", True
            
        'Film noir
        Case 3
            Process "Film noir", True
        
        'Glass tiles
        Case 4
            Process "Glass tiles", True
        
        'Kaleidoscope
        Case 5
            Process "Kaleidoscope", True
        
        'Modern art
        Case 6
            Process "Modern art", True
        
        'Oil painting
        Case 7
            Process "Oil painting", True
                        
        'Posterize
        Case 8
            Process "Posterize", True
            
        'Relief
        Case 9
            Process "Relief", True
            
        'Stained glass
        Case 10
            Process "Stained glass", True
    
    End Select

End Sub

'All blur filters are handled here
Private Sub MnuBlurFilter_Click(Index As Integer)

    Select Case Index
        
        'Box blur
        Case 0
            Process "Box blur", True
        
        'Gaussian blur
        Case 1
            Process "Gaussian blur", True
        
        'Surface Blur
        Case 2
            Process "Surface blur", True
        
        '<separator>
        Case 3
        
        'Motion blur
        Case 4
            Process "Motion blur", True
        
        'Radial blur
        Case 5
            Process "Radial blur", True
        
        'Zoom Blur
        Case 6
            Process "Zoom blur", True
            
        '<separator>
        Case 7
        
        'Kuwahara
        Case 8
            Process "Kuwahara filter", True
            
        'Symmetric nearest-neighbor
        Case 9
            Process "Symmetric nearest-neighbor", True
            
        'Currently unused:
        
        'Chroma blur
        'Case X
            'Process "Chroma blur", True
            
        'Grid blur
        'Case X
        '    Process "Grid blur", , , UNDO_LAYER
            
    End Select

End Sub

Private Sub MnuClearMRU_Click()
    g_RecentFiles.MRU_ClearList
End Sub

'All Color sub-menu entries are handled here.
Private Sub MnuColor_Click(Index As Integer)

    Select Case Index
    
        'Color balance
        Case 0
            Process "Color balance", True
        
        'White balance
        Case 1
            Process "White balance", True
        
        '<separator>
        Case 2
        
        'HSL
        Case 3
            Process "Hue and saturation", True
            
        'Temperature
        Case 4
            Process "Temperature", True
            
        'Tint
        Case 5
            Process "Tint", True
        
        'Vibrance
        Case 6
            Process "Vibrance", True
        
        '<separator>
        Case 7
        
        'Grayscale (black and white)
        Case 8
            Process "Black and white", True
        
        'Colorize
        Case 9
            Process "Colorize", True
            
        'Replace color
        Case 10
            Process "Replace color", True
                
        'Sepia
        Case 11
            Process "Sepia", , , UNDO_LAYER

    End Select

End Sub

'All entries in the "Color -> Components sub-menu are handled here"
Private Sub MnuColorComponents_Click(Index As Integer)

    Select Case Index
    
        'Channel mixer
        Case 0
            Process "Channel mixer", True
        
        'Rechannel
        Case 1
            Process "Rechannel", True
            
        '<separator>
        Case 2
        
        'Max channel
        Case 3
            Process "Maximum channel", , , UNDO_LAYER
        
        'Min channel
        Case 4
            Process "Minimum channel", , , UNDO_LAYER
            
        '<separator>
        Case 5
        
        'Shift colors left
        Case 6
            Process "Shift colors (left)", , , UNDO_LAYER
            
        'Shift colors right
        Case 7
            Process "Shift colors (right)", , , UNDO_LAYER
        
    End Select
    
End Sub

Private Sub MnuCompoundInvert_Click()
    Process "Compound invert", False, BuildParams("128"), UNDO_LAYER
End Sub

Private Sub MnuCustomFilter_Click()
    Process "Custom filter", True
End Sub

'All distortion filters happen here
Private Sub MnuDistortEffects_Click(Index As Integer)

    Select Case Index
    
        'Apply lens distort
        Case 0
            Process "Apply lens distortion", True
        
        'Remove lens distort
        Case 1
            Process "Correct lens distortion", True
        
        '<separator>
        Case 2
        
        'Donut
        Case 3
            Process "Donut", True
            
        'Pinch and whirl
        Case 4
            Process "Pinch and whirl", True
        
        'Poke
        Case 5
            Process "Poke", True
        
        'Ripple
        Case 6
            Process "Ripple", True
        
        'Squish (formerly Fixed Perspective)
        Case 7
            Process "Squish", True
        
        'Swirl
        Case 8
            Process "Swirl", True
        
        'Waves
        Case 9
            Process "Waves", True
            
        '<separator>
        Case 10
        
        'Miscellaneous
        Case 11
            Process "Miscellaneous distort", True
        
    End Select

End Sub

Private Sub MnuDream_Click()
    Process "Dream", , , UNDO_LAYER
End Sub

Private Sub MnuEdge_Click(Index As Integer)

    Select Case Index
        
        'Emboss/engrave
        Case 0
            Process "Emboss", True
         
        'Enhance edges
        Case 1
            Process "Enhance edges", True
        
        'Find edges
        Case 2
            Process "Find edges", True
        
        'Range filter
        Case 3
            Process "Range filter", True
        
        'Trace contour
        Case 4
            Process "Trace contour", True
    
    End Select

End Sub

Private Sub MnuEdit_Click(Index As Integer)

    Select Case Index
    
        'Undo
        Case 0
            Process "Undo", False
        
        'Redo
        Case 1
            Process "Redo", False
        
        'Undo history
        Case 2
            Process "Undo history", True
            
        '<separator>
        Case 3
        
        'Repeat last
        Case 4
            'TODO: figure out Undo handling for "Repeat last action"
            Process "Repeat last action", False, , UNDO_IMAGE
                
        'Fade...
        Case 5
            Process "Fade", True
        
        '<separator>
        Case 6
        
        'Cut from image
        Case 7
            Process "Cut", False, , UNDO_IMAGE, , True
            
        'Cut from layer
        Case 8
        
            'If a selection is active, the Undo/Redo engine can simply back up the current layer contents.  If, however, no selection is active,
            ' we must delete the entire layer.  That requires a backup of the full image contents.
            If pdImages(g_CurrentImage).selectionActive Then
                Process "Cut from layer", False, , UNDO_LAYER, , True
            Else
                Process "Cut from layer", False, , UNDO_IMAGE, , True
            End If
            
        'Copy from image
        Case 9
            Process "Copy", False, , UNDO_NOTHING, , False
        
        'Copy from layer
        Case 10
            Process "Copy from layer", False, , UNDO_NOTHING, , False
        
        'Paste as new image
        Case 11
            Process "Paste as new image", False, , UNDO_NOTHING, , False
        
        'Paste as new layer
        Case 12
            Process "Paste as new layer", False, , UNDO_IMAGE_VECTORSAFE, , False
        
        '<separator>
        Case 13
        
        'Empty clipboard
        Case 14
            Process "Empty clipboard", False, , UNDO_NOTHING, , False
                
    
    End Select
    
End Sub

'All file menu actions are launched from here
Private Sub MnuFile_Click(Index As Integer)

    Select Case Index
    
        'New
        Case 0
            Process "New image", True
        
        'Open
        Case 1
            Process "Open", True
        
        '<Open Recent top-level>
        Case 2
        
        '<Import top-level>
        Case 3
        
        '<separator>
        Case 4
        
        'Close
        Case 5
            Process "Close", True
        
        'Close all
        Case 6
            Process "Close all", True
            
        '<separator>
        Case 7
        
        'Save
        Case 8
            Process "Save", True
            
        'Save copy (lossless)
        Case 9
            Process "Save copy", , , UNDO_NOTHING
            
        'Save as
        Case 10
            Process "Save as", True
        
        'Revert
        Case 11
            'TODO: figure out correct Undo behavior for REVERT action
            Process "Revert", False, , UNDO_NOTHING
        
        '<separator>
        Case 12
        
        'Batch top-level menu
        Case 13
        
        '<separator>
        Case 14
        
        'Print
        Case 15
            Process "Print", True
            
        '<separator>
        Case 16
        
        'Exit
        Case 17
            Process "Exit program", True
        
    
    End Select
    
End Sub

Private Sub MnuFitOnScreen_Click()
    Image_Canvas_Handler.FitOnScreen
End Sub

Private Sub MnuHeatmap_Click()
    Process "Thermograph (heat map)", , , UNDO_LAYER
End Sub

'All help menu entries are launched from here
Private Sub MnuHelp_Click(Index As Integer)

    Select Case Index
        
        'Donations are so very, very welcome!
        Case 0
            OpenURL "http://photodemon.org/donate"
            
        'Check for updates
        Case 2
            Message "Checking for software updates..."
            
            'Initiate an asynchronous download of the standard PD update file (photodemon.org/downloads/updates.xml).
            ' When the asynchronous download completes, the downloader will place the completed update file in the /Data/Updates subfolder.
            ' On exit (or subsequent program runs), PD will check for the presence of that file, then proceed accordingly.
            Me.asyncDownloader.AddToQueue "PROGRAM_UPDATE_CHECK_USER", "http://photodemon.org/downloads/updates/pdupdate.xml", , vbAsyncReadForceUpdate, False, g_UserPreferences.GetUpdatePath & "updates.xml"
            
        
        'Submit feedback
        Case 3
            OpenURL "http://photodemon.org/about/contact/"
        
        'Submit bug report
        Case 4
            'GitHub requires a login for submitting Issues; check for that first
            Dim msgReturn As VbMsgBoxResult
            
            'If the user has previously been prompted about having a GitHub account, use their previous answer
            If g_UserPreferences.DoesValueExist("Core ", "Has GitHub Account") Then
            
                Dim hasGitHub As Boolean
                hasGitHub = g_UserPreferences.GetPref_Boolean("Core", "Has GitHub Account", False)
                
                If hasGitHub Then msgReturn = vbYes Else msgReturn = vbNo
            
            'If this is the first time they are submitting feedback, ask them if they have a GitHub account
            Else
            
                msgReturn = PDMsgBox("Thank you for submitting a bug report.  To make sure your bug is addressed as quickly as possible, PhotoDemon needs to know where to send it." & vbCrLf & vbCrLf & "Do you have a GitHub account? (If you have no idea what this means, answer ""No"".)", vbQuestion + vbApplicationModal + vbYesNoCancel, "Thanks for fixing PhotoDemon")
                
                'If their answer was anything but "Cancel", store that answer to file
                If msgReturn = vbYes Then g_UserPreferences.SetPref_Boolean "Core", "Has GitHub Account", True
                If msgReturn = vbNo Then g_UserPreferences.SetPref_Boolean "Core", "Has GitHub Account", False
                
            End If
            
            'If they have a GitHub account, let them submit the bug there.  Otherwise, send them to the photodemon.org contact form
            If msgReturn = vbYes Then
                'Shell a browser window with the GitHub issue report form
                OpenURL "https://github.com/tannerhelland/PhotoDemon/issues/new"
            ElseIf msgReturn = vbNo Then
                'Shell a browser window with the photodemon.org contact form
                OpenURL "http://photodemon.org/about/contact/"
            End If
            
        'PhotoDemon's homepage
        Case 6
            OpenURL "http://www.photodemon.org"
            
        'Download source code
        Case 7
            OpenURL "https://github.com/tannerhelland/PhotoDemon"
        
        'Read terms and license agreement
        Case 8
            OpenURL "http://photodemon.org/about/license/"
            
        'Display About page
        Case 10
            ShowPDDialog vbModal, FormAbout
        
    End Select

End Sub

Private Sub MnuHistogram_Click()
    'Process "Display histogram", True
    ShowPDDialog vbModal, FormHistogram
End Sub

Private Sub MnuHistogramEqualize_Click()
    Process "Equalize", True
End Sub

Private Sub MnuHistogramStretch_Click()
    Process "Stretch histogram", , , UNDO_LAYER
End Sub

'All top-level Image menu actions are handled here
Private Sub MnuImage_Click(Index As Integer)

    Select Case Index
    
        'Duplicate
        Case 0
            Process "Duplicate image", , , UNDO_NOTHING
        
        '<separator>
        Case 1
        
        'Resize
        Case 2
            Process "Resize image", True
            
        'Content-aware resize
        Case 3
            Process "Content-aware image resize", True
        
        '<separator>
        Case 4
        
        'Canvas resize
        Case 5
            Process "Canvas size", True
            
        'Fit canvas to active layer
        Case 6
            Process "Fit canvas to layer", False, BuildParams(pdImages(g_CurrentImage).GetActiveLayerIndex), UNDO_IMAGEHEADER
        
        'Fit canvas around all layers
        Case 7
            Process "Fit canvas to all layers", False, , UNDO_IMAGEHEADER
            
        '<separator>
        Case 8
            
        'Crop to selection
        Case 9
            Process "Crop", True
            
        'Trim empty borders
        Case 10
            Process "Trim empty borders", , , UNDO_IMAGEHEADER
        
        '<separator>
        Case 11
        
        'Top-level Rotate
        Case 12
        
        'Flip horizontal (mirror)
        Case 13
            Process "Flip image horizontally", , , UNDO_IMAGE
        
        'Flip vertical
        Case 14
            Process "Flip image vertically", , , UNDO_IMAGE
        
        'NOTE: isometric view was removed in 6.4.  I may include it at a later date if there is demand.
        'Isometric view
        'Case 12
        '    Process "Isometric conversion"
            
        '<separator>
        Case 15
        
        'Metadata top-level
        Case 16
    
    End Select

End Sub

'This is the exact same thing as "Paste as New Image".  It is provided in two locations for convenience.
Private Sub MnuImportClipboard_Click()
    Process "Paste as new image", False, , UNDO_NOTHING, , False
End Sub

'Attempt to import an image from the Internet
Private Sub MnuImportFromInternet_Click()
    Process "Internet import", True
End Sub

Private Sub MnuAlien_Click()
    Process "Alien", , , UNDO_LAYER
End Sub

Private Sub MnuInvertHue_Click()
    Process "Invert hue", , , UNDO_LAYER
End Sub

'When a language is clicked, immediately activate it
Private Sub mnuLanguages_Click(Index As Integer)

    Screen.MousePointer = vbHourglass
    
    'Because loading a language can take some time, display a wait screen to discourage attempted interaction
    DisplayWaitScreen g_Language.TranslateMessage("Please wait while the new language is applied..."), Me
    
    'Remove the existing translation from any visible windows
    Message "Removing existing translation..."
    g_Language.UndoTranslations FormMain, True
    g_Language.UndoTranslations toolbar_Toolbox, True
    g_Language.UndoTranslations toolbar_Options, True
    g_Language.UndoTranslations toolbar_Layers, True
    
    'Apply the new translation
    Message "Applying new translation..."
    g_Language.ActivateNewLanguage Index, True
    
    Message "Language changed successfully."
    
    HideWaitScreen
    
    Screen.MousePointer = vbDefault
    
    'Added 09 January 2014.  Let the user know that some translations will not take affect until the program is restarted.
    ' (Subsequently removed 15 Jan 2016.  TODO 6.8: consider removing permanently.)
    'PDMsgBox "Language changed successfully!" & vbCrLf & vbCrLf & "Note: some minor program text cannot be live-updated.  Such text will be properly translated the next time you start the application.", vbApplicationModal + vbOKOnly + vbInformation, "Language changed successfully"
    
End Sub

Private Sub MnuLighting_Click(Index As Integer)

    Select Case Index
            
        'Brightness/Contrast
        Case 0
            Process "Brightness and contrast", True
        
        'Curves
        Case 1
            Process "Curves", True
            
        'Gamma correction
        Case 2
            Process "Gamma", True
            
        'Levels
        Case 3
            Process "Levels", True

        'Shadows/Midtones/Highlights
        Case 4
            Process "Shadow and highlight", True
            
    End Select

End Sub

'Load all images in the current "Recent Files" menu
Private Sub MnuLoadAllMRU_Click()
    
    Dim listOfFiles As pdStringStack
    Set listOfFiles = New pdStringStack
    
    Dim i As Long
    For i = 0 To g_RecentFiles.MRU_ReturnCount() - 1
        listOfFiles.AddString g_RecentFiles.getSpecificMRU(i)
    Next i
    
    Loading.LoadMultipleImageFiles listOfFiles, True
    
End Sub

'All metadata sub-menu options are handled here
Private Sub MnuMetadata_Click(Index As Integer)

    Select Case Index
    
        'Browse metadata
        Case 0
            ExifTool.ShowMetadataDialog pdImages(g_CurrentImage)
        
        'Separator
        Case 1
        
        'Count colors
        Case 2
            Process "Count image colors", True
        
        'Map photo location
        Case 3
            
            If Not pdImages(g_CurrentImage).imgMetadata.HasGPSMetadata Then
                PDMsgBox "This image does not contain any GPS metadata.", vbOKOnly + vbApplicationModal + vbInformation, "No GPS data found"
                Exit Sub
            End If
            
            Dim gMapsURL As String, latString As String, lonString As String
            If pdImages(g_CurrentImage).imgMetadata.FillLatitudeLongitude(latString, lonString) Then
                
                'Build a valid Google maps URL (you can use Google to see what the various parameters mean)
                                
                'Note: I find a zoom of 18 ideal, as that is a common level for switching to an "aerial"
                ' view instead of a satellite view.  Much higher than that and you run the risk of not
                ' having data available at that high of zoom.
                gMapsURL = "https://maps.google.com/maps?f=q&z=18&t=h&q=" & latString & "%2c+" & lonString
                
                'As a convenience, request Google Maps in the current language
                If g_Language.TranslationActive Then
                    gMapsURL = gMapsURL & "&hl=" & g_Language.GetCurrentLanguage()
                Else
                    gMapsURL = gMapsURL & "&hl=en"
                End If
                
                'Launch Google maps in the user's browser
                OpenURL gMapsURL
                
            End If
            
    End Select
    
End Sub

Private Sub MnuMonochrome_Click(Index As Integer)
    
    Select Case Index
        
        'Convert color to monochrome
        Case 0
            Process "Color to monochrome", True
        
        'Convert monochrome to grayscale
        Case 1
            Process "Monochrome to grayscale", True
        
    End Select
    
End Sub

Private Sub MnuNatureFilter_Click(Index As Integer)

    Select Case Index
    
        'Atmosphere
        Case 0
            Process "Atmosphere", , , UNDO_LAYER
        
        'Fog
        Case 1
            Process "Fog", True
        
        'Freeze
        Case 2
            Process "Freeze", , , UNDO_LAYER
            
        'Ignite
        Case 3
            Process "Ignite", True
        
        'Lava
        Case 4
            Process "Lava", , , UNDO_LAYER
        
        'Metal (formerly "steel")
        Case 5
            Process "Metal", True
        
        'Water
        Case 6
            Process "Water", , , UNDO_LAYER
    
    End Select

End Sub

Private Sub MnuNegative_Click()
    Process "Film negative", , , UNDO_LAYER
End Sub

Private Sub MnuInvert_Click()
    Process "Invert RGB", , , UNDO_LAYER
End Sub

'All noise filters are handled here
Private Sub MnuNoise_Click(Index As Integer)

    Select Case Index
    
        'Film grain
        Case 0
            Process "Add film grain", True
        
        'RGB Noise
        Case 1
            Process "Add RGB noise", True
            
        'Separator
        Case 2
        
        'Anisotropic diffusion
        Case 3
            Process "Anisotropic diffusion", True
        
        'Bilateral smoothing
        Case 4
            Process "Bilateral smoothing", True
        
        'Mean shift
        Case 5
            Process "Mean shift", True
        
        'Median
        Case 6
            Process "Median", True
            
    End Select
        
End Sub

Private Sub MnuRadioactive_Click()
    Process "Radioactive", , , UNDO_LAYER
End Sub

'This is triggered whenever a user clicks on one of the "Most Recent Files" entries
Public Sub mnuRecDocs_Click(Index As Integer)
    
    'Load the MRU path that correlates to this index.  (If one is not found, a null string is returned)
    If (Len(g_RecentFiles.getSpecificMRU(Index)) <> 0) Then
        LoadFileAsNewImage g_RecentFiles.getSpecificMRU(Index)
        
        'If the image loaded successfully, activate it and bring it to the foreground
        ' TODO 7.0: thanks to the new window manager, this should no longer be necessary - check it!
        If (g_OpenImageCount > 0) Then ActivatePDImage g_CurrentImage, "MRU entry finished loading"
        
    End If
    
End Sub

'All rotation actions are initiated here
Private Sub MnuRotate_Click(Index As Integer)

    Select Case Index
    
        'Straighten
        Case 0
            Process "Straighten image", True
        
        '<separator>
        Case 1
        
        'Rotate 90
        Case 2
            Process "Rotate image 90 clockwise", , , UNDO_IMAGE
        
        'Rotate 270
        Case 3
            Process "Rotate image 90 counter-clockwise", , , UNDO_IMAGE
        
        'Rotate 180
        Case 4
            Process "Rotate image 180", , , UNDO_IMAGE
        
        'Rotate arbitrary
        Case 5
            Process "Arbitrary image rotation", True
            
    End Select
            
End Sub

Private Sub MnuScanImage_Click()
    Process "Scan image", True
End Sub

Private Sub MnuScreenCapture_Click()
    Process "Screen capture", True
End Sub

'All select menu items are handled here
Private Sub MnuSelect_Click(Index As Integer)

    Select Case Index
    
        'Select all.  (Note that Square Selection is passed as the relevant tool for this action.)
        Case 0
            Process "Select all", , , UNDO_SELECTION
        
        'Select none
        Case 1
            Process "Remove selection", , , UNDO_SELECTION
        
        'Invert
        Case 2
            Process "Invert selection", , , UNDO_SELECTION
        
        '<separator>
        Case 3
        
        'Grow selection
        Case 4
            Process "Grow selection", True
        
        'Shrink selection
        Case 5
            Process "Shrink selection", True
        
        'Border selection
        Case 6
            Process "Border selection", True
        
        'Feather selection
        Case 7
            Process "Feather selection", True
        
        'Sharpen selection
        Case 8
            Process "Sharpen selection", True
        
        '<separator>
        Case 9
        
        'Erase selected area
        Case 10
            Process "Erase selected area", False, BuildParams(pdImages(g_CurrentImage).GetActiveLayerIndex), UNDO_LAYER
        
        '<separator>
        Case 11
        
        'Load selection
        Case 12
            Process "Load selection", True
        
        'Save current selection
        Case 13
            Process "Save selection", True
            
        '<Export top-level>
        Case 14
            
    End Select

End Sub

'All Select -> Export menu items are handled here
Private Sub MnuSelectExport_Click(Index As Integer)

    Select Case Index
    
        'Export selected area as image
        Case 0
            Process "Export selected area as image", True
        
        'Export selection mask itself as image
        Case 1
            Process "Export selection mask as image", True
    
    End Select

End Sub

Private Sub MnuSelectScanner_Click()
    Process "Select scanner or camera", True
End Sub

'All sharpen filters are handled here
Private Sub MnuSharpen_Click(Index As Integer)

    Select Case Index
            
        'Sharpen
        Case 0
            Process "Sharpen", True
        
        'Unsharp mask
        Case 1
            Process "Unsharp mask", True
            
    End Select

End Sub

'These menu items correspond to specific zoom values
Private Sub MnuSpecificZoom_Click(Index As Integer)

    'Only attempt to change zoom if the primary zoom box is not currently disabled
    If FormMain.mainCanvas(0).IsZoomEnabled Then

        Select Case Index
        
            Case 0
                FormMain.mainCanvas(0).SetZoomDropDownIndex 2
            Case 1
                FormMain.mainCanvas(0).SetZoomDropDownIndex 4
            Case 2
                FormMain.mainCanvas(0).SetZoomDropDownIndex 8
            Case 3
                FormMain.mainCanvas(0).SetZoomDropDownIndex 10
            Case 4
                FormMain.mainCanvas(0).SetZoomDropDownIndex g_Zoom.GetZoom100Index
            Case 5
                FormMain.mainCanvas(0).SetZoomDropDownIndex 14
            Case 6
                FormMain.mainCanvas(0).SetZoomDropDownIndex 16
            Case 7
                FormMain.mainCanvas(0).SetZoomDropDownIndex 19
            Case 8
                FormMain.mainCanvas(0).SetZoomDropDownIndex 21
                
        End Select

    End If

End Sub

'All stylize filters are handled here
Private Sub MnuStylize_Click(Index As Integer)

    Select Case Index
    
        'Antique
        Case 0
            Process "Antique", , , UNDO_LAYER
        
        'Diffuse
        Case 1
            Process "Diffuse", True
            
        'Outline
        Case 2
            Process "Outline", True
        
        'Palettize
        Case 3
            Process "Palettize", True
            
        'Portrait glow
        Case 4
            Process "Portrait glow", True
        
        'Solarize
        Case 5
            Process "Solarize", True

        'Twins
        Case 6
            Process "Twins", True
            
        'Vignetting
        Case 7
            Process "Vignetting", True
    
    End Select

End Sub

Private Sub MnuSynthesize_Click()
    Process "Synthesize", , , UNDO_LAYER
End Sub

Private Sub MnuTest_Click()
    
'    'Want to test a new dialog?  Call it here:
'    showPDDialog vbModal, FormToTest
    
    'A longer, more dedicated test function can be accessed in the MenuTest() sub.  It also contains rudimentary code for modifying
    ' an image's pixel data, if you want to test any pixel-based code.
    'MenuTest
    
    'Filters_Miscellaneous.MenuApplyTestPalette
    
'    'Current Gaussian Blur IIR tests:
'    Dim tmpDIB As pdDIB
'    Set tmpDIB = New pdDIB
'    tmpDIB.createFromExistingDIB pdImages(g_CurrentImage).getActiveDIB
'
'    Dim startTime1 As Single, startTime2 As Single
'    startTime1 = Timer
'    Filters_Layers.CreateApproximateGaussianBlurDIB 500, pdImages(g_CurrentImage).getActiveDIB, tmpDIB, 3, True
'    startTime1 = Timer - startTime1
'
'    tmpDIB.createFromExistingDIB pdImages(g_CurrentImage).getActiveDIB
'
'    startTime2 = Timer
'    Filters_Area.GaussianBlur_IIRImplementation tmpDIB, 500, 2, True
'    startTime2 = Timer - startTime2
'
'    MsgBox "Box blur approximation: " & startTime1 & vbCrLf & "IIR approach: " & startTime2

'    'FFT tests
'    Dim cFFT As pdFFT
'    Set cFFT = New pdFFT
'
'    cFFT.testFFT
    
End Sub

'All tool menu items are launched from here
Private Sub mnuTool_Click(Index As Integer)

    Select Case Index
        
        'Languages (top-level)
        Case 0
        
        'Language editor
        Case 1
            If (Not FormLanguageEditor.Visible) Then
                pdHotkeys.Enabled = False
                ShowPDDialog vbModal, FormLanguageEditor
                pdHotkeys.Enabled = True
            End If
            
        '(separator)
        Case 2
        
        'Record macro (top-level)
        Case 3
        
        'Play saved macro
        Case 4
            Process "Play macro", True
        
        'Recent macros (top-level)
        Case 5
        
        '(separator)
        Case 6
    
        'Options
        Case 7
            If (Not FormPreferences.Visible) Then ShowPDDialog vbModal, FormPreferences
            
        'Plugin manager
        Case 8
            If (Not FormPluginManager.Visible) Then ShowPDDialog vbModal, FormPluginManager
            
        '(separator)
        Case 9
        
        'Developer tools (top-level)
        Case 10
            
    End Select

End Sub

'Add / Remove / Modify a layer's alpha channel with this menu
Private Sub MnuLayerTransparency_Click(Index As Integer)

    Select Case Index
            
        'Color to alpha
        Case 0
            Process "Color to alpha", True
        
        'Remove alpha channel
        Case 1
            Process "Remove alpha channel", True
    
    End Select

End Sub

Private Sub MnuVibrate_Click()
    Process "Vibrate", , , UNDO_LAYER
End Sub

'All "Window" menu items are handled here
Private Sub MnuWindow_Click(Index As Integer)
    
    Select Case Index
    
        '<top-level Primary Toolbox options>
        Case 0
            
        'Show/hide tool options
        Case 1
            ToggleToolboxVisibility PDT_BottomToolbox
        
        'Show/hide layer toolbox
        Case 2
            ToggleToolboxVisibility PDT_RightToolbox
        
        '<top-level Image tabstrip>
        Case 3
        
        '<separator>
        Case 4
        
        'Next image
        Case 5
            MoveToNextChildWindow True
            
        'Previous image
        Case 6
            MoveToNextChildWindow False

    End Select

End Sub

'The "Next Image" and "Previous Image" options simply wrap this function.
Private Sub MoveToNextChildWindow(ByVal moveForward As Boolean)

    'If one (or zero) images are loaded, ignore this option
    If g_OpenImageCount <= 1 Then Exit Sub
    
    Dim i As Long
    
    'Loop through all available images, and when we find one that is not this image, activate it and exit
    If moveForward Then
        i = g_CurrentImage + 1
    Else
        i = g_CurrentImage - 1
    End If
    
    Do While (i <> g_CurrentImage)
            
        'Loop back to the start of the window collection
        If moveForward Then
            If (i > g_NumOfImagesLoaded) Then i = 0
            If (i > UBound(pdImages)) Then i = 0
        Else
            If (i < 0) Then i = g_NumOfImagesLoaded
            If (i > UBound(pdImages)) Then i = UBound(pdImages)
        End If
                
        If Not (pdImages(i) Is Nothing) Then
            If pdImages(i).IsActive Then
                ActivatePDImage i, "user requested next/previous image"
                Exit Do
            End If
        End If
                
        If moveForward Then
            i = i + 1
        Else
            i = i - 1
        End If
                
    Loop

End Sub

'Unlike other toolbars, the image tabstrip has a more complicated window menu, because it is viewable under a variety
' of conditions, and we allow the user to specify any alignment.
Private Sub MnuWindowTabstrip_Click(Index As Integer)

    Select Case Index
    
        'Always display image tabstrip
        Case 0
            ToggleImageTabstripVisibility Index
        
        'Display tabstrip for 2+ images (default)
        Case 1
            ToggleImageTabstripVisibility Index
        
        'Never display image tabstrip
        Case 2
            ToggleImageTabstripVisibility Index
        
        '<separator>
        Case 3
        
        'Align left
        Case 4
            ToggleImageTabstripAlignment vbAlignLeft
        
        'Align top
        Case 5
            ToggleImageTabstripAlignment vbAlignTop
        
        'Align right
        Case 6
            ToggleImageTabstripAlignment vbAlignRight
        
        'Align bottom
        Case 7
            ToggleImageTabstripAlignment vbAlignBottom
    
    End Select

End Sub

'Zoom in/out rely on the g_Zoom object to calculate a new value
Private Sub MnuZoomIn_Click()
    If FormMain.mainCanvas(0).IsZoomEnabled Then
        If (FormMain.mainCanvas(0).GetZoomDropDownIndex > 0) Then FormMain.mainCanvas(0).SetZoomDropDownIndex g_Zoom.GetNearestZoomInIndex(FormMain.mainCanvas(0).GetZoomDropDownIndex)
    End If
End Sub

Private Sub MnuZoomOut_Click()
    If FormMain.mainCanvas(0).IsZoomEnabled Then
        If (FormMain.mainCanvas(0).GetZoomDropDownIndex <> g_Zoom.GetZoomCount) Then FormMain.mainCanvas(0).SetZoomDropDownIndex g_Zoom.GetNearestZoomOutIndex(FormMain.mainCanvas(0).GetZoomDropDownIndex)
    End If
End Sub

'Update the main form against the current theme.  At present, this is just a thin wrapper against the public ApplyThemeAndTranslations() function,
' but once the form's menu is owner-drawn, we will likely need some custom code to handle menu redraws and translations.
Public Sub UpdateAgainstCurrentTheme(Optional ByVal useDoEvents As Boolean = False, Optional ByVal suspendIconRendering As Boolean = False)
    ApplyThemeAndTranslations Me, useDoEvents, suspendIconRendering
End Sub

