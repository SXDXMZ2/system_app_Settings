.class public Lcom/sonyericsson/settings/apn/TetherApnData;
.super Ljava/lang/Object;
.source "TetherApnData.java"


# instance fields
.field private mApnData:[Ljava/lang/String;

.field private mIsTetherDunRequired:Z

.field private mIsTetherDunValid:Z

.field private mTypeArrayAsString:Ljava/lang/String;


# direct methods
.method public constructor <init>(ZLjava/lang/String;)V
    .locals 3
    .param p1, "isTetherDunRequired"    # Z
    .param p2, "apnDataString"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 52
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-boolean v2, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mIsTetherDunRequired:Z

    .line 25
    iput-boolean v2, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mIsTetherDunValid:Z

    .line 27
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    .line 53
    iput-boolean p1, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mIsTetherDunRequired:Z

    .line 54
    move-object v0, p2

    .line 57
    .local v0, "apnData":Ljava/lang/String;
    if-eqz v0, :cond_1

    const-string v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 58
    const-string v1, "\\s*,\\s*"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    .line 59
    invoke-direct {p0}, Lcom/sonyericsson/settings/apn/TetherApnData;->getTypeArrayAsString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mTypeArrayAsString:Ljava/lang/String;

    .line 60
    iget-object v1, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    array-length v1, v1

    const/16 v2, 0xd

    if-lt v1, v2, :cond_0

    .line 61
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mIsTetherDunValid:Z

    .line 69
    :cond_0
    :goto_0
    return-void

    .line 65
    :cond_1
    iput-boolean v2, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mIsTetherDunValid:Z

    .line 66
    const/16 v1, 0xe

    new-array v1, v1, [Ljava/lang/String;

    iput-object v1, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    .line 67
    iget-object v1, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const-string v2, ""

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0
.end method

.method private getTypeArrayAsString()Ljava/lang/String;
    .locals 7

    .prologue
    const/16 v6, 0xd

    .line 193
    iget-object v3, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    array-length v3, v3

    if-le v3, v6, :cond_0

    iget-object v3, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    aget-object v3, v3, v6

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 195
    :cond_0
    const/4 v3, 0x0

    .line 210
    :goto_0
    return-object v3

    .line 198
    :cond_1
    iget-object v3, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    array-length v3, v3

    add-int/lit8 v3, v3, -0xd

    new-array v1, v3, [Ljava/lang/String;

    .line 199
    .local v1, "typeArray":[Ljava/lang/String;
    iget-object v3, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    array-length v5, v5

    add-int/lit8 v5, v5, -0xd

    invoke-static {v3, v6, v1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 201
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 203
    .local v2, "types":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v3, v1

    if-ge v0, v3, :cond_3

    .line 204
    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    array-length v3, v1

    add-int/lit8 v3, v3, -0x1

    if-eq v0, v3, :cond_2

    .line 206
    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 210
    :cond_3
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method


# virtual methods
.method public getApn()Ljava/lang/String;
    .locals 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getAuthType()I
    .locals 3

    .prologue
    .line 174
    :try_start_0
    iget-object v1, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/16 v2, 0xc

    aget-object v1, v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 176
    :goto_0
    return v1

    .line 175
    :catch_0
    move-exception v0

    .line 176
    .local v0, "e":Ljava/lang/NumberFormatException;
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public getMcc()Ljava/lang/String;
    .locals 2

    .prologue
    .line 159
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/16 v1, 0xa

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getMmsPort()Ljava/lang/String;
    .locals 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/16 v1, 0x9

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getMmsProxy()Ljava/lang/String;
    .locals 2

    .prologue
    .line 145
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/16 v1, 0x8

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getMmsc()Ljava/lang/String;
    .locals 2

    .prologue
    .line 138
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x7

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getMnc()Ljava/lang/String;
    .locals 2

    .prologue
    .line 166
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/16 v1, 0xb

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getPassword()Ljava/lang/String;
    .locals 2

    .prologue
    .line 124
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x5

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getPort()Ljava/lang/String;
    .locals 2

    .prologue
    .line 110
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x3

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getProxy()Ljava/lang/String;
    .locals 2

    .prologue
    .line 103
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x2

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getServer()Ljava/lang/String;
    .locals 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x6

    aget-object v0, v0, v1

    return-object v0
.end method

.method public getTypeArray()Ljava/lang/String;
    .locals 1

    .prologue
    .line 189
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mTypeArrayAsString:Ljava/lang/String;

    return-object v0
.end method

.method public getUser()Ljava/lang/String;
    .locals 2

    .prologue
    .line 117
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x4

    aget-object v0, v0, v1

    return-object v0
.end method

.method public isTetherDunValid()Z
    .locals 1

    .prologue
    .line 82
    iget-boolean v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mIsTetherDunValid:Z

    return v0
.end method

.method public setApn(Ljava/lang/String;)V
    .locals 2
    .param p1, "apn"    # Ljava/lang/String;

    .prologue
    .line 218
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x1

    aput-object p1, v0, v1

    .line 219
    return-void
.end method

.method public setAuthType(I)V
    .locals 3
    .param p1, "authType"    # I

    .prologue
    .line 262
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/16 v1, 0xc

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    .line 263
    return-void
.end method

.method public setMcc(Ljava/lang/String;)V
    .locals 2
    .param p1, "mcc"    # Ljava/lang/String;

    .prologue
    .line 254
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/16 v1, 0xa

    aput-object p1, v0, v1

    .line 255
    return-void
.end method

.method public setMmsPort(Ljava/lang/String;)V
    .locals 2
    .param p1, "mmsPort"    # Ljava/lang/String;

    .prologue
    .line 250
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/16 v1, 0x9

    aput-object p1, v0, v1

    .line 251
    return-void
.end method

.method public setMmsProxy(Ljava/lang/String;)V
    .locals 2
    .param p1, "mmsProxy"    # Ljava/lang/String;

    .prologue
    .line 246
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/16 v1, 0x8

    aput-object p1, v0, v1

    .line 247
    return-void
.end method

.method public setMmsc(Ljava/lang/String;)V
    .locals 2
    .param p1, "mmsc"    # Ljava/lang/String;

    .prologue
    .line 242
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x7

    aput-object p1, v0, v1

    .line 243
    return-void
.end method

.method public setMnc(Ljava/lang/String;)V
    .locals 2
    .param p1, "mnc"    # Ljava/lang/String;

    .prologue
    .line 258
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/16 v1, 0xb

    aput-object p1, v0, v1

    .line 259
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 214
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 215
    return-void
.end method

.method public setPassword(Ljava/lang/String;)V
    .locals 2
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 234
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x5

    aput-object p1, v0, v1

    .line 235
    return-void
.end method

.method public setPort(Ljava/lang/String;)V
    .locals 2
    .param p1, "port"    # Ljava/lang/String;

    .prologue
    .line 226
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x3

    aput-object p1, v0, v1

    .line 227
    return-void
.end method

.method public setProxy(Ljava/lang/String;)V
    .locals 2
    .param p1, "proxy"    # Ljava/lang/String;

    .prologue
    .line 222
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x2

    aput-object p1, v0, v1

    .line 223
    return-void
.end method

.method public setServer(Ljava/lang/String;)V
    .locals 2
    .param p1, "server"    # Ljava/lang/String;

    .prologue
    .line 238
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x6

    aput-object p1, v0, v1

    .line 239
    return-void
.end method

.method public setTypeArray(Ljava/lang/String;)V
    .locals 0
    .param p1, "typeArrayAsString"    # Ljava/lang/String;

    .prologue
    .line 266
    iput-object p1, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mTypeArrayAsString:Ljava/lang/String;

    .line 267
    return-void
.end method

.method public setUser(Ljava/lang/String;)V
    .locals 2
    .param p1, "user"    # Ljava/lang/String;

    .prologue
    .line 230
    iget-object v0, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    const/4 v1, 0x4

    aput-object p1, v0, v1

    .line 231
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 270
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 271
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v2, 0xd

    if-ge v1, v2, :cond_0

    .line 272
    iget-object v2, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mApnData:[Ljava/lang/String;

    aget-object v2, v2, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 274
    :cond_0
    iget-object v2, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mTypeArrayAsString:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mTypeArrayAsString:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 275
    iget-object v2, p0, Lcom/sonyericsson/settings/apn/TetherApnData;->mTypeArrayAsString:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
