.class public Lcom/android/settings/accounts/SyncSettings;
.super Lcom/android/settings/accounts/AccountPreferenceBase;
.source "SyncSettings.java"

# interfaces
.implements Landroid/accounts/OnAccountsUpdateListener;
.implements Lcom/android/settings/DialogCreatable;


# instance fields
.field private mAuthorities:[Ljava/lang/String;

.field private mAutoSyncPreference:Landroid/preference/CheckBoxPreference;

.field private mDialogFragment:Lcom/android/settings/SettingsPreferenceFragment$SettingsDialogFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/android/settings/accounts/AccountPreferenceBase;-><init>()V

    return-void
.end method

.method private removeAccountPreferences()V
    .locals 3

    .prologue
    .line 141
    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    .line 142
    .local v1, "parent":Landroid/preference/PreferenceScreen;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v1}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 143
    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    instance-of v2, v2, Lcom/android/settings/AccountPreference;

    if-eqz v2, :cond_0

    .line 144
    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/preference/PreferenceScreen;->removePreference(Landroid/preference/Preference;)Z

    goto :goto_0

    .line 146
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 149
    :cond_1
    return-void
.end method

.method private startAccountSettings(Lcom/android/settings/AccountPreference;)V
    .locals 3
    .param p1, "acctPref"    # Lcom/android/settings/AccountPreference;

    .prologue
    .line 124
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.ACCOUNT_SYNC_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 125
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "account"

    invoke-virtual {p1}, Lcom/android/settings/AccountPreference;->getAccount()Landroid/accounts/Account;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 126
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 127
    invoke-virtual {p0, v0}, Lcom/android/settings/accounts/SyncSettings;->startActivity(Landroid/content/Intent;)V

    .line 128
    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->finish()V

    .line 129
    return-void
.end method


# virtual methods
.method public bridge synthetic addPreferencesForType(Ljava/lang/String;Landroid/preference/PreferenceScreen;)Landroid/preference/PreferenceScreen;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;
    .param p2, "x1"    # Landroid/preference/PreferenceScreen;

    .prologue
    .line 46
    invoke-super {p0, p1, p2}, Lcom/android/settings/accounts/AccountPreferenceBase;->addPreferencesForType(Ljava/lang/String;Landroid/preference/PreferenceScreen;)Landroid/preference/PreferenceScreen;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getAuthoritiesForAccountType(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .param p1, "x0"    # Ljava/lang/String;

    .prologue
    .line 46
    invoke-super {p0, p1}, Lcom/android/settings/accounts/AccountPreferenceBase;->getAuthoritiesForAccountType(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public onAccountsUpdated([Landroid/accounts/Account;)V
    .locals 14
    .param p1, "accounts"    # [Landroid/accounts/Account;

    .prologue
    .line 153
    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-nez v1, :cond_0

    .line 186
    :goto_0
    return-void

    .line 155
    :cond_0
    new-instance v6, Lcom/android/settings/accounts/AccountVisibilityFilter;

    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v6, v1}, Lcom/android/settings/accounts/AccountVisibilityFilter;-><init>(Landroid/content/Context;)V

    .line 157
    .local v6, "accountVisibilityFilter":Lcom/android/settings/accounts/AccountVisibilityFilter;
    invoke-direct {p0}, Lcom/android/settings/accounts/SyncSettings;->removeAccountPreferences()V

    .line 158
    const/4 v8, 0x0

    .local v8, "i":I
    array-length v11, p1

    .local v11, "n":I
    :goto_1
    if-ge v8, v11, :cond_5

    .line 159
    aget-object v2, p1, v8

    .line 161
    .local v2, "account":Landroid/accounts/Account;
    iget-object v1, v2, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {v6, v1}, Lcom/android/settings/accounts/AccountVisibilityFilter;->isAccountVisibleInManagerList(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 158
    :cond_1
    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 164
    :cond_2
    iget-object v1, v2, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/android/settings/accounts/SyncSettings;->getAuthoritiesForAccountType(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    .line 166
    .local v4, "auths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v13, 0x1

    .line 167
    .local v13, "showAccount":Z
    iget-object v1, p0, Lcom/android/settings/accounts/SyncSettings;->mAuthorities:[Ljava/lang/String;

    if-eqz v1, :cond_3

    if-eqz v4, :cond_3

    .line 168
    const/4 v13, 0x0

    .line 169
    iget-object v7, p0, Lcom/android/settings/accounts/SyncSettings;->mAuthorities:[Ljava/lang/String;

    .local v7, "arr$":[Ljava/lang/String;
    array-length v10, v7

    .local v10, "len$":I
    const/4 v9, 0x0

    .local v9, "i$":I
    :goto_3
    if-ge v9, v10, :cond_3

    aget-object v12, v7, v9

    .line 170
    .local v12, "requestedAuthority":Ljava/lang/String;
    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 171
    const/4 v13, 0x1

    .line 177
    .end local v7    # "arr$":[Ljava/lang/String;
    .end local v9    # "i$":I
    .end local v10    # "len$":I
    .end local v12    # "requestedAuthority":Ljava/lang/String;
    :cond_3
    if-eqz v13, :cond_1

    .line 178
    iget-object v1, v2, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/android/settings/accounts/SyncSettings;->getDrawableForType(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    .line 179
    .local v3, "icon":Landroid/graphics/drawable/Drawable;
    new-instance v0, Lcom/android/settings/AccountPreference;

    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v5, 0x1

    invoke-direct/range {v0 .. v5}, Lcom/android/settings/AccountPreference;-><init>(Landroid/content/Context;Landroid/accounts/Account;Landroid/graphics/drawable/Drawable;Ljava/util/ArrayList;Z)V

    .line 181
    .local v0, "preference":Lcom/android/settings/AccountPreference;
    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/preference/PreferenceScreen;->addPreference(Landroid/preference/Preference;)Z

    .line 182
    iget-object v1, v2, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/android/settings/accounts/SyncSettings;->getLabelForType(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/settings/AccountPreference;->setSummary(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 169
    .end local v0    # "preference":Lcom/android/settings/AccountPreference;
    .end local v3    # "icon":Landroid/graphics/drawable/Drawable;
    .restart local v7    # "arr$":[Ljava/lang/String;
    .restart local v9    # "i$":I
    .restart local v10    # "len$":I
    .restart local v12    # "requestedAuthority":Ljava/lang/String;
    :cond_4
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 185
    .end local v2    # "account":Landroid/accounts/Account;
    .end local v4    # "auths":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v7    # "arr$":[Ljava/lang/String;
    .end local v9    # "i$":I
    .end local v10    # "len$":I
    .end local v12    # "requestedAuthority":Ljava/lang/String;
    .end local v13    # "showAccount":Z
    :cond_5
    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->onSyncStateUpdated()V

    goto :goto_0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 99
    invoke-super {p0, p1}, Lcom/android/settings/accounts/AccountPreferenceBase;->onActivityCreated(Landroid/os/Bundle;)V

    .line 100
    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 101
    .local v0, "activity":Landroid/app/Activity;
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "authorities"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/settings/accounts/SyncSettings;->mAuthorities:[Ljava/lang/String;

    .line 103
    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->updateAuthDescriptions()V

    .line 104
    return-void
.end method

.method protected onAuthDescriptionsUpdated()V
    .locals 4

    .prologue
    .line 191
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    invoke-virtual {v3}, Landroid/preference/PreferenceScreen;->getPreferenceCount()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 192
    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v2

    .line 193
    .local v2, "pref":Landroid/preference/Preference;
    instance-of v3, v2, Lcom/android/settings/AccountPreference;

    if-eqz v3, :cond_0

    .line 194
    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/preference/PreferenceScreen;->getPreference(I)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Lcom/android/settings/AccountPreference;

    .line 196
    .local v0, "accPref":Lcom/android/settings/AccountPreference;
    invoke-virtual {v0}, Lcom/android/settings/AccountPreference;->getAccount()Landroid/accounts/Account;

    move-result-object v3

    iget-object v3, v3, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/android/settings/accounts/SyncSettings;->getDrawableForType(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/android/settings/AccountPreference;->setIcon(Landroid/graphics/drawable/Drawable;)V

    .line 197
    invoke-virtual {v0}, Lcom/android/settings/AccountPreference;->getAccount()Landroid/accounts/Account;

    move-result-object v3

    iget-object v3, v3, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/android/settings/accounts/SyncSettings;->getLabelForType(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/android/settings/AccountPreference;->setSummary(Ljava/lang/CharSequence;)V

    .line 191
    .end local v0    # "accPref":Lcom/android/settings/AccountPreference;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 200
    .end local v2    # "pref":Landroid/preference/Preference;
    :cond_1
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "icicle"    # Landroid/os/Bundle;

    .prologue
    .line 60
    invoke-super {p0, p1}, Lcom/android/settings/accounts/AccountPreferenceBase;->onCreate(Landroid/os/Bundle;)V

    .line 62
    const v0, 0x7f050046

    invoke-virtual {p0, v0}, Lcom/android/settings/accounts/SyncSettings;->addPreferencesFromResource(I)V

    .line 63
    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->getPreferenceScreen()Landroid/preference/PreferenceScreen;

    move-result-object v0

    const-string v1, "sync_switch"

    invoke-virtual {v0, v1}, Landroid/preference/PreferenceScreen;->findPreference(Ljava/lang/CharSequence;)Landroid/preference/Preference;

    move-result-object v0

    check-cast v0, Landroid/preference/CheckBoxPreference;

    iput-object v0, p0, Lcom/android/settings/accounts/SyncSettings;->mAutoSyncPreference:Landroid/preference/CheckBoxPreference;

    .line 65
    iget-object v0, p0, Lcom/android/settings/accounts/SyncSettings;->mAutoSyncPreference:Landroid/preference/CheckBoxPreference;

    new-instance v1, Lcom/android/settings/accounts/SyncSettings$1;

    invoke-direct {v1, p0}, Lcom/android/settings/accounts/SyncSettings$1;-><init>(Lcom/android/settings/accounts/SyncSettings;)V

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setOnPreferenceChangeListener(Landroid/preference/Preference$OnPreferenceChangeListener;)V

    .line 81
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/android/settings/accounts/SyncSettings;->setHasOptionsMenu(Z)V

    .line 82
    return-void
.end method

.method public bridge synthetic onPause()V
    .locals 0

    .prologue
    .line 46
    invoke-super {p0}, Lcom/android/settings/accounts/AccountPreferenceBase;->onPause()V

    return-void
.end method

.method public onPreferenceTreeClick(Landroid/preference/PreferenceScreen;Landroid/preference/Preference;)Z
    .locals 1
    .param p1, "preferences"    # Landroid/preference/PreferenceScreen;
    .param p2, "preference"    # Landroid/preference/Preference;

    .prologue
    .line 115
    instance-of v0, p2, Lcom/android/settings/AccountPreference;

    if-eqz v0, :cond_0

    .line 116
    check-cast p2, Lcom/android/settings/AccountPreference;

    .end local p2    # "preference":Landroid/preference/Preference;
    invoke-direct {p0, p2}, Lcom/android/settings/accounts/SyncSettings;->startAccountSettings(Lcom/android/settings/AccountPreference;)V

    .line 120
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 118
    .restart local p2    # "preference":Landroid/preference/Preference;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onResume()V
    .locals 2

    .prologue
    .line 93
    invoke-super {p0}, Lcom/android/settings/accounts/AccountPreferenceBase;->onResume()V

    .line 94
    iget-object v0, p0, Lcom/android/settings/accounts/SyncSettings;->mAutoSyncPreference:Landroid/preference/CheckBoxPreference;

    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/preference/CheckBoxPreference;->setChecked(Z)V

    .line 95
    return-void
.end method

.method public onStart()V
    .locals 4

    .prologue
    .line 86
    invoke-super {p0}, Lcom/android/settings/accounts/AccountPreferenceBase;->onStart()V

    .line 87
    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 88
    .local v0, "activity":Landroid/app/Activity;
    invoke-static {v0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, p0, v2, v3}, Landroid/accounts/AccountManager;->addOnAccountsUpdatedListener(Landroid/accounts/OnAccountsUpdateListener;Landroid/os/Handler;Z)V

    .line 89
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 108
    invoke-super {p0}, Lcom/android/settings/accounts/AccountPreferenceBase;->onStop()V

    .line 109
    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 110
    .local v0, "activity":Landroid/app/Activity;
    invoke-static {v0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/accounts/AccountManager;->removeOnAccountsUpdatedListener(Landroid/accounts/OnAccountsUpdateListener;)V

    .line 111
    return-void
.end method

.method public showDialog(I)V
    .locals 3
    .param p1, "dialogId"    # I

    .prologue
    .line 133
    iget-object v0, p0, Lcom/android/settings/accounts/SyncSettings;->mDialogFragment:Lcom/android/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    if-eqz v0, :cond_0

    .line 134
    const-string v0, "AccountSettings"

    const-string v1, "Old dialog fragment not null!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    :cond_0
    new-instance v0, Lcom/android/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    invoke-direct {v0, p0, p1}, Lcom/android/settings/SettingsPreferenceFragment$SettingsDialogFragment;-><init>(Lcom/android/settings/DialogCreatable;I)V

    iput-object v0, p0, Lcom/android/settings/accounts/SyncSettings;->mDialogFragment:Lcom/android/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    .line 137
    iget-object v0, p0, Lcom/android/settings/accounts/SyncSettings;->mDialogFragment:Lcom/android/settings/SettingsPreferenceFragment$SettingsDialogFragment;

    invoke-virtual {p0}, Lcom/android/settings/accounts/SyncSettings;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/settings/SettingsPreferenceFragment$SettingsDialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 138
    return-void
.end method

.method public bridge synthetic updateAuthDescriptions()V
    .locals 0

    .prologue
    .line 46
    invoke-super {p0}, Lcom/android/settings/accounts/AccountPreferenceBase;->updateAuthDescriptions()V

    return-void
.end method
