.class public Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;
.super Landroid/content/BroadcastReceiver;
.source "TetheringMobileStateReceiver.java"


# static fields
.field private static APNTYPE_DEFAULT:Ljava/lang/String;

.field private static APNTYPE_HIPRI:Ljava/lang/String;

.field private static TYPES_INDEX:I

.field private static sShowDialogFih:Z

.field private static sShowDialogSoMC:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 55
    sput-boolean v1, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->sShowDialogSoMC:Z

    .line 57
    sput-boolean v1, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->sShowDialogFih:Z

    .line 60
    const-string v0, "default"

    sput-object v0, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->APNTYPE_DEFAULT:Ljava/lang/String;

    .line 61
    const-string v0, "hipri"

    sput-object v0, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->APNTYPE_HIPRI:Ljava/lang/String;

    .line 62
    sput v1, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->TYPES_INDEX:I

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private getOperatorNumeric()[Ljava/lang/String;
    .locals 6

    .prologue
    .line 302
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 304
    .local v2, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/telephony/MSimTelephonyManager;->getPreferredDataSubscription()I

    move-result v0

    .line 305
    .local v0, "PreferredDataSubscription":I
    const-string v3, "TetheringMobileStateReceiver"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "[FXN.ASD]PreferredDataSubscription: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    const-string v3, "gsm.apn.sim.operator.numeric"

    const/4 v4, 0x0

    invoke-static {v3, v0, v4}, Landroid/telephony/MSimTelephonyManager;->getTelephonyProperty(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 310
    .local v1, "mccMncFromSim":Ljava/lang/String;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 311
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 313
    :cond_0
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    return-object v3
.end method

.method private getOperatorNumericSelection()Ljava/lang/String;
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 295
    invoke-direct {p0}, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->getOperatorNumeric()[Ljava/lang/String;

    move-result-object v0

    .line 297
    .local v0, "mccmncs":[Ljava/lang/String;
    aget-object v2, v0, v4

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "numeric=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, v0, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 298
    .local v1, "where":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 297
    .end local v1    # "where":Ljava/lang/String;
    :cond_0
    const-string v1, ""

    goto :goto_0
.end method

.method private isApnSupported([Ljava/lang/String;Ljava/lang/String;)Z
    .locals 8
    .param p1, "allApnTypes"    # [Ljava/lang/String;
    .param p2, "apn"    # Ljava/lang/String;

    .prologue
    .line 251
    const-string v5, "TetheringMobileStateReceiver"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "[FXN.ASD]isApnSupported, apnType to check: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    const/4 v4, 0x0

    .line 254
    .local v4, "result":Z
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_0
    array-length v5, p1

    if-ge v3, v5, :cond_2

    .line 255
    aget-object v5, p1, v3

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 256
    .local v1, "apnTypes":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v5, v1

    if-ge v2, v5, :cond_1

    .line 257
    aget-object v0, v1, v2

    .line 258
    .local v0, "apnType":Ljava/lang/String;
    invoke-virtual {v0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 259
    const/4 v4, 0x1

    .line 256
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 254
    .end local v0    # "apnType":Ljava/lang/String;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 263
    .end local v1    # "apnTypes":[Ljava/lang/String;
    .end local v2    # "i":I
    :cond_2
    return v4
.end method

.method private isDataEnabled(Landroid/content/Context;)Z
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 240
    const-string v2, "connectivity"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 242
    .local v0, "connMgr":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getMobileDataEnabled()Z

    move-result v1

    .line 244
    .local v1, "result":Z
    const-string v2, "TetheringMobileStateReceiver"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[FXN.ASD]isDataEnabled = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    return v1
.end method

.method private static isTetherDunRequired(Landroid/content/Context;)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 232
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "tether_dun_required"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_0

    .line 234
    .local v0, "result":Z
    :goto_0
    const-string v1, "TetheringMobileStateReceiver"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "[FXN.ASD]isTetherDunRequired = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 236
    return v0

    .end local v0    # "result":Z
    :cond_0
    move v0, v1

    .line 232
    goto :goto_0
.end method

.method private isTethered(Landroid/content/Context;)Z
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 202
    const-string v2, "connectivity"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 203
    .local v0, "connMgr":Landroid/net/ConnectivityManager;
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getTetheredIfaces()[Ljava/lang/String;

    move-result-object v1

    .line 204
    .local v1, "tethered":[Ljava/lang/String;
    if-eqz v1, :cond_0

    array-length v2, v1

    if-lez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private queryApnTypeList(Landroid/content/Context;)[Ljava/lang/String;
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, 0x0

    .line 267
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 269
    .local v6, "apnTypes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {p0}, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->getOperatorNumericSelection()Ljava/lang/String;

    move-result-object v3

    .line 270
    .local v3, "where":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 271
    const-string v1, "TetheringMobileStateReceiver"

    const-string v2, "[FXN.ASD]getOperatorNumericSelection is empty "

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 290
    :goto_0
    return-object v0

    .line 274
    :cond_0
    const/4 v7, 0x0

    .line 276
    .local v7, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Telephony$Carriers;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "_id"

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const-string v5, "type"

    aput-object v5, v2, v4

    const/4 v4, 0x0

    const-string v5, "name ASC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 279
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 280
    :goto_1
    invoke-interface {v7}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_2

    .line 281
    sget v0, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->TYPES_INDEX:I

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 282
    .local v8, "type":Ljava/lang/String;
    const-string v0, "TetheringMobileStateReceiver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[FXN.ASD]queryApnTypeList, type : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 283
    if-eqz v8, :cond_1

    .line 284
    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 286
    :cond_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 290
    .end local v8    # "type":Ljava/lang/String;
    :catchall_0
    move-exception v0

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    throw v0

    .line 288
    :cond_2
    :try_start_1
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 290
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    goto :goto_0
.end method

.method private showInfoDialog(Landroid/content/Context;)V
    .locals 2

    .prologue
    .line 208
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonyericsson/tetherentitlementcheck/TetheringFailDialog;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 209
    const/high16 v1, 0x18800000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 211
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 212
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 66
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    .line 67
    .local v1, "action":Ljava/lang/String;
    const-string v13, "persist.sys.gsmcall"

    const/4 v14, 0x0

    invoke-static {v13, v14}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v13

    const/4 v14, 0x1

    if-ne v13, v14, :cond_1

    const/4 v7, 0x1

    .line 70
    .local v7, "gsmCall":Z
    :goto_0
    const-string v13, "TetheringMobileStateReceiver"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "[FXN.ASD]onReceive action: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", gsmCall: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    const-string v13, "android.net.conn.TETHER_STATE_CHANGED"

    invoke-virtual {v13, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_7

    .line 75
    invoke-direct/range {p0 .. p1}, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->isTethered(Landroid/content/Context;)Z

    move-result v13

    if-nez v13, :cond_2

    .line 77
    const-string v13, "TetheringMobileStateReceiver"

    const-string v14, "[FXN.ASD]Not in tethered state"

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    const/4 v13, 0x1

    sput-boolean v13, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->sShowDialogSoMC:Z

    .line 80
    const/4 v13, 0x1

    sput-boolean v13, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->sShowDialogFih:Z

    .line 176
    :cond_0
    :goto_1
    return-void

    .line 67
    .end local v7    # "gsmCall":Z
    :cond_1
    const/4 v7, 0x0

    goto :goto_0

    .line 84
    .restart local v7    # "gsmCall":Z
    :cond_2
    const-string v13, "connectivity"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/ConnectivityManager;

    .line 85
    .local v5, "connMgr":Landroid/net/ConnectivityManager;
    const/4 v13, 0x5

    invoke-virtual {v5, v13}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v8

    .line 86
    .local v8, "hipriInfo":Landroid/net/NetworkInfo;
    const/4 v13, 0x0

    invoke-virtual {v5, v13}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v10

    .line 89
    .local v10, "mobileInfo":Landroid/net/NetworkInfo;
    const-string v13, "TetheringMobileStateReceiver"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "[FXN.ASD]"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v8}, Landroid/net/NetworkInfo;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    const-string v13, "TetheringMobileStateReceiver"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "[FXN.ASD]"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v10}, Landroid/net/NetworkInfo;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    invoke-direct/range {p0 .. p1}, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->isDataEnabled(Landroid/content/Context;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 94
    invoke-direct/range {p0 .. p1}, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->queryApnTypeList(Landroid/content/Context;)[Ljava/lang/String;

    move-result-object v2

    .line 95
    .local v2, "allApnTypes":[Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->isTetherDunRequired(Landroid/content/Context;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 100
    const/4 v13, 0x4

    invoke-virtual {v5, v13}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v6

    .line 101
    .local v6, "dunInfo":Landroid/net/NetworkInfo;
    const-string v13, "TetheringMobileStateReceiver"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "[FXN.ASD]"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v6}, Landroid/net/NetworkInfo;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 104
    .end local v6    # "dunInfo":Landroid/net/NetworkInfo;
    :cond_3
    invoke-virtual {v10}, Landroid/net/NetworkInfo;->isConnectedOrConnecting()Z

    move-result v13

    if-eqz v13, :cond_4

    .line 105
    const-string v13, "TetheringMobileStateReceiver"

    const-string v14, "[FXN.ASD] mobile data is connected/connecting. Tethering is available"

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    .line 107
    :cond_4
    if-eqz v2, :cond_6

    sget-object v13, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->APNTYPE_HIPRI:Ljava/lang/String;

    move-object/from16 v0, p0

    invoke-direct {v0, v2, v13}, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->isApnSupported([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_6

    .line 111
    const-string v13, "TetheringMobileStateReceiver"

    const-string v14, "[FXN.ASD] has Hipri APN, check isAvailable"

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    invoke-virtual {v8}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v13

    if-nez v13, :cond_0

    .line 121
    .end local v2    # "allApnTypes":[Ljava/lang/String;
    :cond_5
    :goto_2
    sget-boolean v13, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->sShowDialogSoMC:Z

    if-eqz v13, :cond_0

    .line 122
    invoke-direct/range {p0 .. p1}, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->showInfoDialog(Landroid/content/Context;)V

    .line 123
    const/4 v13, 0x0

    sput-boolean v13, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->sShowDialogSoMC:Z

    goto/16 :goto_1

    .line 116
    .restart local v2    # "allApnTypes":[Ljava/lang/String;
    :cond_6
    const-string v13, "TetheringMobileStateReceiver"

    const-string v14, "[FXN.ASD]No valid APN type. Show error dialog"

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 125
    .end local v2    # "allApnTypes":[Ljava/lang/String;
    .end local v5    # "connMgr":Landroid/net/ConnectivityManager;
    .end local v8    # "hipriInfo":Landroid/net/NetworkInfo;
    .end local v10    # "mobileInfo":Landroid/net/NetworkInfo;
    :cond_7
    const-string v13, "android.intent.action.DATA_CONNECTION_FAILED"

    invoke-virtual {v13, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_a

    .line 126
    const-string v13, "reason"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 128
    .local v11, "reason":Ljava/lang/String;
    const-string v13, "TetheringMobileStateReceiver"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "[FXN.ASD]DATA_CONNECTION_FAILED reason: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    const-string v13, "TetheringMobileStateReceiver"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "[FXN.ASD] DATA_CONNECTION_FAILED, DATA_APN_TYPE_KEY: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "apnType"

    move-object/from16 v0, p2

    invoke-virtual {v0, v15}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 132
    const-string v13, "default"

    const-string v14, "apnType"

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    const-string v13, "dataDisabled"

    invoke-virtual {v11, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_9

    const/4 v12, 0x1

    .line 138
    .local v12, "showDialogForDefault":Z
    :goto_3
    const-string v13, "dun"

    const-string v14, "apnType"

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_8

    const-string v13, "hipri"

    const-string v14, "apnType"

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_8

    if-eqz v12, :cond_0

    :cond_8
    invoke-direct/range {p0 .. p1}, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->isTethered(Landroid/content/Context;)Z

    move-result v13

    if-eqz v13, :cond_0

    if-nez v7, :cond_0

    .line 142
    sget-boolean v13, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->sShowDialogSoMC:Z

    if-eqz v13, :cond_0

    .line 143
    invoke-direct/range {p0 .. p1}, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->showInfoDialog(Landroid/content/Context;)V

    .line 144
    const/4 v13, 0x0

    sput-boolean v13, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->sShowDialogSoMC:Z

    goto/16 :goto_1

    .line 132
    .end local v12    # "showDialogForDefault":Z
    :cond_9
    const/4 v12, 0x0

    goto :goto_3

    .line 149
    .end local v11    # "reason":Ljava/lang/String;
    :cond_a
    const-string v13, "android.net.MobileDataStateTracker.APN_TYPE_NOT_AVAILABLE"

    invoke-virtual {v13, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 150
    const-string v13, "connectivity"

    move-object/from16 v0, p1

    invoke-virtual {v0, v13}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/ConnectivityManager;

    .line 152
    .local v4, "cm":Landroid/net/ConnectivityManager;
    const/4 v13, 0x0

    invoke-virtual {v4, v13}, Landroid/net/ConnectivityManager;->getNetworkInfo(I)Landroid/net/NetworkInfo;

    move-result-object v13

    invoke-virtual {v13}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v9

    .line 153
    .local v9, "isDefaultNetworkConnected":Z
    const-string v13, "apnType"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 156
    .local v3, "apnType":Ljava/lang/String;
    const-string v13, "TetheringMobileStateReceiver"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "[FXN.ASD]APN_TYPE_NOT_AVAILABLE, isDefaultNetworkConnected: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", apnType: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, ", sShowDialogFih: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    sget-boolean v15, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->sShowDialogFih:Z

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    const-string v13, "default"

    invoke-virtual {v3, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_0

    invoke-direct/range {p0 .. p1}, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->isTethered(Landroid/content/Context;)Z

    move-result v13

    if-eqz v13, :cond_0

    if-nez v7, :cond_0

    .line 169
    sget-boolean v13, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->sShowDialogFih:Z

    if-eqz v13, :cond_0

    .line 170
    invoke-direct/range {p0 .. p1}, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->showInfoDialog(Landroid/content/Context;)V

    .line 171
    const/4 v13, 0x0

    sput-boolean v13, Lcom/sonyericsson/tetherentitlementcheck/TetheringMobileStateReceiver;->sShowDialogFih:Z

    goto/16 :goto_1
.end method
