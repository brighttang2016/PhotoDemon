VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "pdViewport"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'***************************************************************************
'Image Viewport Support Class
'Copyright 2001-2017 by Tanner Helland
'Created: 15/April/01
'Last updated: 13/September/15
'Last update: overhaul the class completely as part of prepping for paint tools
'
'While many viewport actions and operations are universal regardless of image, some elements are image-specific -
' for example, the positioning of the image on the canvas, which is contingent on the image's size, the current zoom,
' and the size of the viewport/canvas.
'
'Rather than let these tracking variables float around inside the parent pdImage object, they are now stored
' inside this dedicated viewport class.  Eventually, zoom and other viewport-related factors should probably be
' moved here as well.
'
'This class was completely overhauled prior to the 7.0 release, as part of prepping for paint tools.  It now stores
' a lot more viewport-specific data, which greatly simplifies tasks like coordinate space conversions in other
' functions.  Almost everything in this class is created by the Viewport_Engine module, so look there for details
' on how various structs are calculated and filled.
'
'All source code in this file is licensed under a modified BSD license.  This means you may use the code in your own
' projects IF you provide attribution.  For more information, please visit http://photodemon.org/about/license/
'
'***************************************************************************

Option Explicit

'As of version 7.0, the first stage of the viewport pipeline uses RectF structs to store the calculated
' coordinate regions.  See the Viewport_Engine module for more details on how these structs are used.
Private ImageRect_CanvasCoords As RECTF
Private ImageRect_TranslatedCanvasCoords As RECTF
Private CanvasRect_ImageCoords As RECTF
Private CanvasRect_ActualPixels As RECTF

'The area of the canvas covered by the image is stored here.  Note that a separate boolean is also stored,
' on the off chance that the canvas and image do not currently intersect.
Private doCanvasAndImageIntersect As Boolean
Private CanvasImageIntersect As RECTF
Private SrcImageIntersect As RECTF

'Current scroll bar values.  These are saved/restored when the active image changes.
Private hScrollValue As Long, vScrollValue As Long

Public Sub SetHScrollValue(ByVal newValue As Long)
    hScrollValue = newValue
End Sub

Public Sub SetVScrollValue(ByVal newValue As Long)
    vScrollValue = newValue
End Sub

Friend Sub SetIntersectState(ByRef newState As Boolean)
    doCanvasAndImageIntersect = newState
End Sub

Friend Sub SetIntersectRectCanvas(ByRef srcRectF As RECTF)
    CanvasImageIntersect = srcRectF
End Sub

Friend Sub SetIntersectRectImage(ByRef srcRectF As RECTF)
    SrcImageIntersect = srcRectF
End Sub

Friend Sub SetImageRectCanvasCoords(ByRef srcRectF As RECTF)
    ImageRect_CanvasCoords = srcRectF
End Sub

Friend Sub SetImageRectTranslated(ByRef srcRectF As RECTF)
    ImageRect_TranslatedCanvasCoords = srcRectF
End Sub

Friend Sub SetCanvasRectImageCoords(ByRef srcRectF As RECTF)
    CanvasRect_ImageCoords = srcRectF
End Sub

Friend Sub SetCanvasRectActualPixels(ByRef srcRectF As RECTF)
    CanvasRect_ActualPixels = srcRectF
End Sub

Public Function GetHScrollValue() As Long
    GetHScrollValue = hScrollValue
End Function

Public Function GetVScrollValue() As Long
    GetVScrollValue = vScrollValue
End Function

Friend Function GetIntersectState() As Boolean
    GetIntersectState = doCanvasAndImageIntersect
End Function

Friend Sub GetIntersectRectCanvas(ByRef dstRectF As RECTF)
    dstRectF = CanvasImageIntersect
End Sub

Friend Sub GetIntersectRectImage(ByRef dstRectF As RECTF)
    dstRectF = SrcImageIntersect
End Sub

Friend Sub GetImageRectCanvasCoords(ByRef dstRectF As RECTF)
    dstRectF = ImageRect_CanvasCoords
End Sub

Friend Sub GetImageRectTranslated(ByRef dstRectF As RECTF)
    dstRectF = ImageRect_TranslatedCanvasCoords
End Sub

Friend Sub GetCanvasRectImageCoords(ByRef dstRectF As RECTF)
    dstRectF = CanvasRect_ImageCoords
End Sub

Friend Sub GetCanvasRectActualPixels(ByRef dstRectF As RECTF)
    dstRectF = CanvasRect_ActualPixels
End Sub

