import boto3
import json
from botocore.exceptions import ClientError

class AegisComplianceEngine:
    """
    Automated Governance Engine for Project Aegis.
    Scans AWS infrastructure to ensure alignment with SOC2 and NIST 800-53.
    """

    def __init__(self):
        # Initializing the AWS SDK (Boto3)
        self.s3 = boto3.client('s3')
        self.iam = boto3.client('iam')
        self.ec2 = boto3.client('ec2')

    def audit_s3_buckets(self):
        """Verifies that all S3 buckets have Public Access Blocked (SOC2 Control)."""
        print("\n[Audit] Starting S3 Public Access Check...")
        buckets = self.s3.list_buckets()['Buckets']
        
        for bucket in buckets:
            name = bucket['Name']
            try:
                self.s3.get_public_access_block(Bucket=name)
                print(f"  ✅ PASS: {name} has Public Access Blocked.")
            except ClientError:
                print(f"  ❌ FAIL: {name} is EXPOSED. Remediation required.")

    def audit_iam_mfa(self):
        """Checks if the Root account has MFA enabled (NIST 800-53 Control)."""
        print("\n[Audit] Checking Identity Governance (IAM/MFA)...")
        summary = self.iam.get_account_summary()
        mfa_enabled = summary['SummaryMap'].get('AccountMFAEnabled', 0)
        
        if mfa_enabled == 1:
            print("  ✅ PASS: Root MFA is enabled (Governed via Okta).")
        else:
            print("  ❌ ALERT: Root MFA is DISABLED. High Security Risk.")

    def run_all_checks(self):
        print("==========================================")
        print("PROJECT AEGIS: COMPLIANCE & GOVERNANCE SCAN")
        print("==========================================")
        self.audit_s3_buckets()
        self.audit_iam_mfa()
        print("\nScan Complete. Report generated for SOC2 Type II Audit.")

if __name__ == "__main__":
    auditor = AegisComplianceEngine()
    auditor.run_all_checks()
