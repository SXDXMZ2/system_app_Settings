.class Lcom/android/settings/users/AppRestrictionsFragment$3;
.super Ljava/lang/Object;
.source "AppRestrictionsFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/settings/users/AppRestrictionsFragment;->onCreateDialog(I)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/settings/users/AppRestrictionsFragment;


# direct methods
.method constructor <init>(Lcom/android/settings/users/AppRestrictionsFragment;)V
    .locals 0

    .prologue
    .line 1106
    iput-object p1, p0, Lcom/android/settings/users/AppRestrictionsFragment$3;->this$0:Lcom/android/settings/users/AppRestrictionsFragment;

    invoke-direct/range {p0 .. p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1109
    iget-object v0, p0, Lcom/android/settings/users/AppRestrictionsFragment$3;->this$0:Lcom/android/settings/users/AppRestrictionsFragment;

    # invokes: Lcom/android/settings/users/AppRestrictionsFragment;->clearEditUserInfoDialog()V
    invoke-static {v0}, Lcom/android/settings/users/AppRestrictionsFragment;->access$1500(Lcom/android/settings/users/AppRestrictionsFragment;)V

    .line 1110
    return-void
.end method
