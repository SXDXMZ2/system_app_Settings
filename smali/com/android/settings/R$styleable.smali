.class public final Lcom/android/settings/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final BatteryHistoryChart:[I

.field public static final ChartGridView:[I

.field public static final ChartNetworkSeriesView:[I

.field public static final ChartSweepView:[I

.field public static final ChartView:[I

.field public static final CheckBoxPreference:[I

.field public static final DependOnPreference:[I

.field public static final IconPreferenceScreen:[I

.field public static final IncludePreference:[I

.field public static final IntentPreference:[I

.field public static final PercentageBarChart:[I

.field public static final RemovePreference:[I

.field public static final WifiEncryptionState:[I

.field public static final WifiLimitedState:[I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 10008
    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/android/settings/R$styleable;->BatteryHistoryChart:[I

    .line 10110
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/android/settings/R$styleable;->ChartGridView:[I

    .line 10172
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_2

    sput-object v0, Lcom/android/settings/R$styleable;->ChartNetworkSeriesView:[I

    .line 10240
    const/4 v0, 0x6

    new-array v0, v0, [I

    fill-array-data v0, :array_3

    sput-object v0, Lcom/android/settings/R$styleable;->ChartSweepView:[I

    .line 10340
    new-array v0, v4, [I

    fill-array-data v0, :array_4

    sput-object v0, Lcom/android/settings/R$styleable;->ChartView:[I

    .line 10396
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_5

    sput-object v0, Lcom/android/settings/R$styleable;->CheckBoxPreference:[I

    .line 10517
    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_6

    sput-object v0, Lcom/android/settings/R$styleable;->DependOnPreference:[I

    .line 10715
    new-array v0, v3, [I

    const v1, 0x7f010001

    aput v1, v0, v2

    sput-object v0, Lcom/android/settings/R$styleable;->IconPreferenceScreen:[I

    .line 10738
    new-array v0, v3, [I

    const v1, 0x7f010012

    aput v1, v0, v2

    sput-object v0, Lcom/android/settings/R$styleable;->IncludePreference:[I

    .line 10763
    new-array v0, v3, [I

    const v1, 0x7f01001d

    aput v1, v0, v2

    sput-object v0, Lcom/android/settings/R$styleable;->IntentPreference:[I

    .line 10794
    new-array v0, v4, [I

    fill-array-data v0, :array_7

    sput-object v0, Lcom/android/settings/R$styleable;->PercentageBarChart:[I

    .line 10844
    new-array v0, v4, [I

    fill-array-data v0, :array_8

    sput-object v0, Lcom/android/settings/R$styleable;->RemovePreference:[I

    .line 10890
    new-array v0, v3, [I

    const/high16 v1, 0x7f010000

    aput v1, v0, v2

    sput-object v0, Lcom/android/settings/R$styleable;->WifiEncryptionState:[I

    .line 10917
    new-array v0, v3, [I

    const v1, 0x7f010025

    aput v1, v0, v2

    sput-object v0, Lcom/android/settings/R$styleable;->WifiLimitedState:[I

    return-void

    .line 10008
    nop

    :array_0
    .array-data 4
        0x1010034
        0x1010095
        0x1010096
        0x1010097
        0x1010098
        0x1010161
        0x1010162
        0x1010163
        0x1010164
    .end array-data

    .line 10110
    :array_1
    .array-data 4
        0x7f01000b
        0x7f01000c
        0x7f01000d
        0x7f01000e
    .end array-data

    .line 10172
    :array_2
    .array-data 4
        0x7f01000f
        0x7f010010
        0x7f010011
    .end array-data

    .line 10240
    :array_3
    .array-data 4
        0x7f010006
        0x7f010007
        0x7f010008
        0x7f010009
        0x7f01000a
        0x7f01000b
    .end array-data

    .line 10340
    :array_4
    .array-data 4
        0x7f010004
        0x7f010005
    .end array-data

    .line 10396
    :array_5
    .array-data 4
        0x7f01001e
        0x7f01001f
        0x7f010020
        0x7f010021
        0x7f010022
    .end array-data

    .line 10517
    :array_6
    .array-data 4
        0x7f010013
        0x7f010014
        0x7f010015
        0x7f010016
        0x7f010017
        0x7f010018
        0x7f010019
        0x7f01001a
        0x7f01001b
        0x7f01001c
    .end array-data

    .line 10794
    :array_7
    .array-data 4
        0x7f010002
        0x7f010003
    .end array-data

    .line 10844
    :array_8
    .array-data 4
        0x7f010023
        0x7f010024
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9981
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
