.class final Lcom/android/settings/users/AppRestrictionsFragment$EditUserPhotoController$AdapterItem;
.super Ljava/lang/Object;
.source "AppRestrictionsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/settings/users/AppRestrictionsFragment$EditUserPhotoController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AdapterItem"
.end annotation


# instance fields
.field final id:I

.field final title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "id"    # I

    .prologue
    .line 1347
    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    .line 1348
    iput-object p1, p0, Lcom/android/settings/users/AppRestrictionsFragment$EditUserPhotoController$AdapterItem;->title:Ljava/lang/String;

    .line 1349
    iput p2, p0, Lcom/android/settings/users/AppRestrictionsFragment$EditUserPhotoController$AdapterItem;->id:I

    .line 1350
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 1354
    iget-object v0, p0, Lcom/android/settings/users/AppRestrictionsFragment$EditUserPhotoController$AdapterItem;->title:Ljava/lang/String;

    return-object v0
.end method
