<aura:application implements="forceCommunity:availableForAllPageTypes" access="GLOBAL" extends="ltng:outApp">
    <ltng:require styles="/resource/LightningCSS/assets/styles/salesforce-lightning-design-system.css" />
    <div class="YOUR_CUSTOM_SCOPING_CLASS_NAME">
        <span class="slds-icon__container slds-icon-standard-account">
            <c:svg class="slds-icon" xlinkHref="/resource/LightningCSS/assets/icons/standard-sprite/svg/symbols.svg#account" />
            <span class="slds-assistive-text">Account Icon</span>
        </span>
    </div>
	<c:camping ></c:camping>
    <!--<c:AccountListHeader />
<c:AccountCreateComponent />
<c:AccountListComponent />-->
</aura:application>